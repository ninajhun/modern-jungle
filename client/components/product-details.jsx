import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
    this.backToCatalog = this.backToCatalog.bind(this);
  }

  componentDidMount() {
    const id = this.props.params.productId;

    fetch(`/api/products/${id}`)
      .then(response => response.json())
      .then(data => {
        this.setState({
          product: data
        });
      });

  }

  backToCatalog() {
    this.props.setView('catalog', {});
  }

  render() {

    if (this.state.product) {
      return (
        <div className="card mt-3">

          <div className="container">
            <div className="row">
              <p className="text-muted mt-3 back-button" onClick = {this.backToCatalog}> &lt; Back to Catalog</p>
            </div>

            <div className="row">
              <div className="col-lg-5 col-sm-12">
                <img src={this.state.product.image} className="img mr-2" alt="..."></img>
              </div>
              <div className="col-lg-7 col-sm-12">
                <h5>
                  {this.state.product.name}
                </h5>
                <h6 className="mb-2">
                  ${(this.state.product.price / 100).toFixed(2)}
                </h6>
                <p>
                  {this.state.product.shortDescription}
                </p>

                <button className="btn btn-light" onClick = {() => { this.props.addToCart(this.state.product); }}>Add to Cart</button>

              </div>
            </div>

            <div className="row">
              <div className="col mt-2">
                <p>
                  {this.state.product.longDescription}
                </p>
              </div>

            </div>
          </div>

        </div>
      );
    } else {
      return null;
    }
  }

}

export default ProductDetails;
