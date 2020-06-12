import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
    this.getProducts = this.getProducts.bind(this);
    this.createProductCards = this.createProductCards.bind(this);
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(response => response.json())
      .then(data => {
        this.setState({
          products: data
        });
      });
  }

  createProductCards() {
    const productCards = [];
    for (let i = 0; i < this.state.products.length; i++) {
      productCards.push(
        <ProductListItem key={this.state.products[i].id}
          image={this.state.products[i].image}
          name={this.state.products[i].name}
          price={this.state.products[i].price}
          description={this.state.products[i].shortDescription} />
      );
    }

    return productCards;

  }

  render() {

    const productCards = this.createProductCards();

    return (
      <div className="row">
        {productCards}
      </div>

    );
  }
}

export default ProductList;
