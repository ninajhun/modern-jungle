import React from 'react';
import Header from './header';
import ProductList from './product-list';
// import ProductDetails from './product-details';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'catalog',
        params: {}
      }
    };
    this.setView = this.setView.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  render() {
    return (
      <div className="container-fluid">
        <Header />
        <ProductList setView = {this.setView} />
        {/* <ProductDetails id = {4} /> */}
      </div>

    );
  }

}
