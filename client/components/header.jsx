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
    this.props.cartItemCount === 1 ? items = 'Item' : items = 'Items';

    return (
      <div className="row header py-2 align-items-center justify-content-between flex-nowrap">

        <a className="antic-slab header-name ml-5" onClick={() => this.props.setView('catalog', {})}>
          <i className="fab fa-pagelines"></i>
            Modern Jungle
        </a>

        <h6 className= "mr-5" onClick={this.openCart}>{this.props.cartItemCount} {items} <i className="fas fa-shopping-cart"></i></h6>

      </div>
    );
  }
}

export default Header;
