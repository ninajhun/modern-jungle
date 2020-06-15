import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'catalog',
        params: {},
        cart: []
      }
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);

  }

  componentDidMount() {
    this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params,
        cart: this.state.view.cart
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
        console.log(data);
        this.setState({
          view: {
            name: this.state.view.name,
            params: this.state.view.params,
            cart: this.state.view.cart.push(data)
          }
        });
      })
      .catch(err => {
        console.error(err);
      });

  }

  getCartItems() {
    fetch('/api/cart')
      .then(result => result.json())
      .then(data => {
        this.setState({
          view: {
            name: this.state.view.name,
            params: this.state.view.params,
            cart: data
          }
        });
      });
  }

  render() {
    if (this.state.view.name === 'catalog') {
      return (
        <div className="container-fluid">
          <Header cartItemCount={this.state.view.cart.length} />
          <ProductList setView={this.setView} />
        </div>
      );
    }

    if (this.state.view.name === 'details') {
      return (
        <div className="container-fluid">
          <Header cartItemCount = {this.state.view.cart.length}/>
          <ProductDetails params = {this.state.view.params} setView = {this.setView}/>
        </div>
      );
    }
  }

}
