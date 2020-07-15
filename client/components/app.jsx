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
        name: 'catalog',
        params: {}
      },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);

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

  placeOrder(cart) {
    fetch('api/orders', {
      method: 'POST',
      header: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(cart)
    })
      .then(response => response.json())
      .then(data => {
        this.setState({
          view: {
            name: 'catalog',
            params: {}
          }
        });
      });
  }

  render() {

    const body = this.state.view.name === 'catalog'
      ? <ProductList setView={this.setView} />
      : this.state.view.name === 'cart'
        ? <CartSummary cart={this.state.cart} setView={this.setView} />
        : <ProductDetails params={this.state.view.params} setView={this.setView} addToCart={this.addToCart} />;

    return (
      <div className="container-fluid">
        <Header cartItemCount={this.state.cart.length} setView = {this.setView} />
        {body}
      </div>
    );

  }

}
