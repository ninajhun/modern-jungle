import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'catalog', // change back to catalog after passing event listener to cart button
        params: {}
      },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);

  }

  componentDidMount() {
    this.getCartItems();
  }

  getCartItems() {
    fetch('/api/cart')
      .then(result => result.json())
      .then(data => {
        this.setState({
          cart: data
        });
      });
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });

  }

  addToCart(product) {

    fetch('api/cart', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(product)
    })
      .then(response => response.json())
      .then(data => {
        this.setState({
          cart: this.state.cart.concat(data)
        });
      })
      .catch(err => {
        console.error(err);
      });

  }

  render() {

    if (this.state.view.name === 'catalog') {

      return (
        <div className="container-fluid">
          <Header cartItemCount={this.state.cart.length} setView = {this.setView} />
          <ProductList setView={this.setView} />
        </div>
      );
    }

    if (this.state.view.name === 'details') {
      return (
        <div className="container-fluid">
          <Header cartItemCount = {this.state.cart.length} setView = {this.setView}/>
          <ProductDetails params = {this.state.view.params} setView = {this.setView} addToCart = {this.addToCart}/>
        </div>
      );
    }

    if (this.state.view.name === 'cart') {
      return (
        <div className="container-fluid">
          <Header cartItemCount={this.state.cart.length} setView = {this.setView} />
          <CartSummary cart={this.state.cart} setView={this.setView} />
        </div>
      );
    }

  }

}
