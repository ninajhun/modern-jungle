import React from 'react';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  render() {

    if (!this.props.cart.length) {
      return (
        <div>
          <p>No items in cart.</p>
        </div>
      );
    }

    return (
      <div className="row justify-content-center">

        <h2>My Cart</h2>

        <div className="row justify-content-center">
          {
            this.props.cart.map(cartItem => {
              return <CartSummaryItem key={cartItem.cartItemId} item={cartItem} />;
            })
          }
        </div>
      </div>
    );
  }

}

export default CartSummary;
