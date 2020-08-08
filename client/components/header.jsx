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
      <div className="row header py-2 align-items-center d-flex flex-nowrap">
        <div className="col-lg-10 col-md-9 col-sm-9">
          <h4 className="ml-5 antic-slab" onClick={() => this.props.setView('catalog', {})}>
            <i className="fab fa-pagelines"></i>
            Urban Jungle
          </h4>
        </div>

        <div className="col-lg-2 col-md-3 col-sm-3 d-flex justify-content-between">
          <h6 onClick={this.openCart}>{this.props.cartItemCount} {items} <i className="fas fa-shopping-cart"></i></h6>
        </div>

      </div>
    );
  }
}

export default Header;
