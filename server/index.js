
require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  const sql = `
    select "p"."image",
           "p"."name",
           "p"."price",
           "p"."productId",
           "p"."shortDescription"
      from "products" as "p"
    `;

  db.query(sql)
    .then(result => res.status(200).json(result.rows))
    .catch(err => next(err));

});

app.get('/api/products/:productId', (req, res, next) => {

  const productId = parseInt(req.params.productId);
  const sql = `
   select  *
      from "products" as "p"
      where "productId" = $1;
    `;
  const id = [productId];

  db.query(sql, id)
    .then(result => {
      const product = result.rows[0];
      if (!product) {
        next();
      } else {
        res.status(200).json(product);
      }
    })
    .catch(err => next(err));

});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
