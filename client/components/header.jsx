import React from 'react';

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.openCart = this.openCart.bind(this);
  }

  openCart() {
    this.props.setView('cart', {});
  }

  backToCatalog() {
    this.props.setView('catalog', {});
  }

  render() {
    let items;
    this.props.cartItemCount === '1'
      ? items = 'Item'
      : items = 'Items';

    return (
      <div className="row header py-2 align-items-center">
        <div className="col-10 ">
          <h4 className="ml-5" onClick={() => this.props.setView('catalog', {})}>
            Urban Jungle
          </h4>
        </div>

        <div className="col-2">
          <h6 onClick={this.openCart}>{this.props.cartItemCount} {items} <i className="fas fa-shopping-cart"></i></h6>
        </div>

      </div>
    );
  }
}

export default Header;
