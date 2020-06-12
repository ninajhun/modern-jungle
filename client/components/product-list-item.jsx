import React from 'react';

class ProductListItem extends React.Component {

  render() {
    return (
      <div>
        <div className="card col-3 m-3">
          <img src={this.props.image} className="card-img-top" alt="..."></img>
          <div className="card-body">
            <h5 className="card-title">
              {this.props.name}
            </h5>
            <h6 className="card-subtitle text-muted mb-2">
              {this.props.price}
            </h6>
            <p className = "card-text">
              {this.props.description}
            </p>

          </div>
        </div>
      </div>

    );
  }
}

export default ProductListItem;
