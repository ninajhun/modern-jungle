import React from 'react';

class CartSummaryItem extends React.Component {

  render() {

    if (!this.props.item) {
      return null;
    }

    return (
      <div className="card m-1">
        <div className="row align-items-center">

          <div className="col">
            <img src={this.props.item.image} className="card-img-top contain" alt="..."></img>
          </div>

          <div className="col">
            <h5 className="card-title">
              {this.props.item.name}
            </h5>
            <h6 className="card-subtitle text-muted mb-2">
              ${(this.props.item.price / 100).toFixed(2)}
            </h6>
            <p className="card-text">
              {this.props.item.shortDescription}
            </p>

          </div>
        </div>

      </div>
    );
  }

}

export default CartSummaryItem;
