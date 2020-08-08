import React from 'react';

function CartSummaryItem(props) {
  if (!props.item) {
    return null;
  } else {
    return (
      <div className="card m-1 col-10">
        <div className="row align-items-center">

          <div className="col-lg-6 col-sm-12">
            <img src={props.item.image} className="card-img-top contain" alt="..."></img>
          </div>

          <div className="col-lg-6 col-sm-12">
            <h5 className="card-title ">
              {props.item.name}
            </h5>
            <h6 className="card-subtitle text-muted mb-2">
                ${(props.item.price / 100).toFixed(2)}
            </h6>
            <p className="card-text">
              {props.item.shortDescription}
            </p>

          </div>
        </div>

      </div>
    );
  }
}

export default CartSummaryItem;
