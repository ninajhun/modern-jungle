import React from 'react';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: '',
      disclaimer: false
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {

    if (event.target.name === 'disclaimer') {
      if (!this.state.disclaimer) {
        this.setState({
          disclaimer: true
        });
      } else {
        this.setState({
          disclaimer: false
        });
      }
    } else {
      this.setState({
        [event.target.name]: event.target.value
      });
    }

  }

  handleSubmit(event) {
    event.preventDefault();

    const order = {
      name: this.state.name,
      creditCard: this.state.creditCard,
      shippingAddress: this.state.shippingAddress
    };

    this.props.placeOrder(order);

  }

  render() {
    const totalPrice = this.props.cart.reduce((accumulator, current) => accumulator + (current.price / 100), 0);
    return (
      <div>
        <div className="row ml-5 mt-3">
          <p className="text-muted" onClick={this.backToCatalog}> &lt; Back to catalog</p>
        </div>

        <div className="row mt-3 d-flex justify-content-center">
          <div className="col-9">
            <h1 className='antic-slab'>My Cart</h1>
            <h4>Order Total: ${totalPrice}  </h4>
          </div>
        </div>

        <div className="row d-flex justify-content-center mt-3">

          <form className="col-9" encType="multipart/form-data" onSubmit ={this.handleSubmit}>
            <div className="form-group">
              <label>Name</label>
              <input type='text' name="name" className="form-control" value={this.state.name} onChange ={this.handleChange} />
            </div>

            <div className="form-group">
              <label>Credit Card</label>
              <input type='text' name="creditCard" className="form-control" value={this.state.creditCard} onChange={this.handleChange} />
            </div>

            <div className="form-group">
              <label>Address</label>
              <textarea name="shippingAddress" className="form-control" value={this.state.shippingAddress} onChange={this.handleChange}></textarea>
            </div>

            <div className="form-check">
              <input type="checkbox" name="disclaimer" className="form-check-input" value={this.state.disclaimer} onChange={this.handleChange} />
              <p>I verify that I did not use my real personal information and credit card. This application is purely for demonstration purposes only.</p>

              <div>
                <button type="submit" className='btn btn-light'>Purchase</button>
              </div>

            </div>
          </form>

        </div>

      </div>

    );

  }

}

export default CheckoutForm;
