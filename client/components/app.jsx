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

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params,
        cart: this.state.view.cart
      }
    });

  }

  componentDidMount() {
    this.getCartItems();
  }

  getCartItems() {
    fetch('/api/cart')
      .then(result => result.json())
      .then(data => {
        // console.log(data);
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
