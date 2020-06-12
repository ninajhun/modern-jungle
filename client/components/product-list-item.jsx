import React from 'react';

class ProductListItem extends React.Component {

  render() {
    return (
      <div>
        <div className="card col-3 m-3">
          <img src="..." className="card-img-top" alt="..."></img>
          <div className="card-body">
            <h5 className="card-title">
              Product Title
            </h5>
            <h6 className="card-subtitle text-muted mb-2">
              $00.00
            </h6>
            <p className = "card-text">
                Product information
            </p>

          </div>
        </div>
      </div>

    );
  }
}

export default ProductListItem;
