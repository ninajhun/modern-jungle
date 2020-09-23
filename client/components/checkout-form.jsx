import React from 'react';

class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: '',
      disclaimer: false,
      isFormComplete: false
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.checkFormComplete = this.checkFormComplete.bind(this);
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

    this.checkFormComplete();
  }

  checkFormComplete() {
    if (this.state.name && this.state.creditCard && this.state.shippingAddress && this.state.disclaimer) {
      console.log('hi');

      this.setState({
        isFormComplete: true
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

    let checkoutBtn;
    this.state.isFormComplete ? checkoutBtn = <button type="submit" className='btn btn-secondary checkout-btn-complete'>Place Order</button>
      : checkoutBtn = <button type="submit" className='btn btn-light checkout-btn-incomplete'>Place Order</button>;

    return (
      <div>
        <div className="row ml-5 mt-3">
          <p className="text-muted back-button" onClick={() => this.props.setView('cart', {})}> &lt; Back to Cart </p>
        </div>

        <div className="row mt-3 d-flex justify-content-center">
          <div className="col-lg-9 col-sm-10">
            <h1 className='antic-slab'>Checkout</h1>
            <h4>Order Total: ${totalPrice}  </h4>
          </div>
        </div>

        <div className="row d-flex justify-content-center mt-3 mb-5 ">

          <form className="col-lg-9 col-sm-11" encType="multipart/form-data" onSubmit ={this.handleSubmit}>
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
              <p>I verify that I did not use my real personal information and credit card number. This application is purely for demonstration purposes only and no real purchases will be made.</p>

              <div>
                {checkoutBtn}
              </div>

            </div>
          </form>

        </div>

      </div>

    );

  }

}

export default CheckoutForm;
