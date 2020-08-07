import React from 'react';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {
  constructor(props) {
    super(props);
    this.backToCatalog = this.backToCatalog.bind(this);

  }

  backToCatalog() {
    this.props.setView('catalog', {});
  }

  render() {

    const totalPrice = this.props.cart.reduce((accumulator, current) => accumulator + (current.price / 100), 0);

    if (!this.props.cart.length) {
      return (
        <div>
          <p className="text-muted" onClick={this.backToCatalog}> &lt; Back to catalog</p>
          <p>No items in cart.</p>
        </div>
      );
    }

    return (
      <div>
        <div className="row ml-5 mt-3">
          <p className="text-muted" onClick={this.backToCatalog}> &lt; Back to catalog</p>
        </div>

        <div className="row d-flex justify-content-center mt-3">
          <div className="col-9">
            <h1 className='antic-slab'>My Cart</h1>
          </div>
        </div>

        <div className="row justify-content-center">
          {
            this.props.cart.map(cartItem => {
              return <CartSummaryItem key={cartItem.cartItemId} item={cartItem} />;
            })
          }
        </div>

        <div className="row mt-3 mb-3">
          <div className="col-6 d-flex justify-content-center">
            <h5 className='ml-5'>
              Item Total: ${totalPrice}
            </h5>
          </div>
          <div className="col-6 d-flex justify-content-center">
            <button className="btn btn-secondary " onClick={() => this.props.setView('checkout', {})}>Checkout</button>
          </div>

        </div>
      </div>
    );
  }

}

export default CartSummary;
