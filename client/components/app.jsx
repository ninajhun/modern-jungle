import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';
import LandingPage from './landing-page';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'catalog',
        params: {}
      },
      cart: [],
      isModalOpen: true
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.handleModal = this.handleModal.bind(this);
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

  placeOrder(order) {
    fetch('/api/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(order)
    })
      .then(response => response.json())
      .then(data => {
        this.setState({
          view: {
            name: 'catalog',
            params: {}
          },
          cart: []
        });
      })
      .catch(err => console.error(err));
  }

  handleModal() {
    if (!this.state.isModalOpen) {
      this.setState({
        isModalOpen: true
      });
    } else {
      this.setState({
        isModalOpen: false
      });
    }
  }

  render() {
    let modal;
    if (!this.state.isModalOpen) {
      modal = null;
    } else {
      modal = <LandingPage setView={this.setView} handleModal={this.handleModal} />;
    }

    let body;
    switch (this.state.view.name) {
      case 'catalog':
        body = <ProductList setView={this.setView} />;
        break;

      case 'cart':
        body = <CartSummary cart={this.state.cart} setView={this.setView} />;
        break;

      case 'details':
        body = <ProductDetails params={this.state.view.params} setView={this.setView} addToCart={this.addToCart} />;
        break;

      case 'checkout':
        body = <CheckoutForm setView={this.setView} placeOrder={this.placeOrder} cart={this.state.cart}/>;
        break;
    }

    return (
      <div>

        {modal}

        <div className="container-fluid">
          <Header cartItemCount={this.state.cart.length} setView={this.setView} />
          {body}
        </div>

      </div>
    );

  }

}
