import React from 'react';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  render() {

    return (
      <div className="row justify-content-center">
        {
          this.props.cart.map(cartItem => {
            return <CartSummaryItem key={cartItem.cartItemId} item={cartItem} />;
          })
        }
      </div>
    );
  }

}

export default CartSummary;
