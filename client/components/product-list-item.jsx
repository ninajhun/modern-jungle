import React from 'react';

class ProductListItem extends React.Component {
  constructor(props) {
    super(props);
    this.onClick = this.onClick.bind(this);
  }

  onClick() {
    const params = {
      productId: this.props.product.productId
    };
    this.props.setView('details', params);
  }

  render() {
    return (
      <div className="card col-lg-3 col-md-5 col-sm-5 m-2 product-card" onClick ={this.onClick}>

        <img src={this.props.product.image} className="card-img-top contain" alt="..."></img>

        <div className="card-body">
          <h5 className="card-title">
            {this.props.product.name}
          </h5>
          <h6 className="card-subtitle text-muted mb-2">
           ${(this.props.product.price / 100).toFixed(2)}
          </h6>
          <p className = "card-text">
            {this.props.product.shortDescription}
          </p>

        </div>
      </div>

    );
  }
}

export default ProductListItem;
