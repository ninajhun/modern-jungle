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
      <div className="row bg-dark py-2  align-items-center">
        <div className="col-10 ">
          <h4 className="text-white ml-5" onClick={() => this.props.setView('catalog', {})}>
            <i className="fas fa-dollar-sign"></i>
            Wicked Sales
          </h4>
        </div>

        <div className="col-2">
          <h6 className='text-white' onClick = {this.openCart}>{this.props.cartItemCount} {items} <i className="fas fa-shopping-cart"></i></h6>
        </div>

      </div>
    );
  }
}

export default Header;
