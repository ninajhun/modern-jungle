import React from 'react';

function LandingPage(props) {
  return (
    <div className ="d-flex justify-content-center">
      <div className="modal-overlay"></div>

      <div className="card landing-modal justify-content-center ">
        <div className="card-body">
          <p className="welcome-text text-center">welcome to </p>
          <p className="title-text text-center"><span className="highlight">Modern</span> Jungle</p>
          <p className="title-description text-center mx-3">This website is a full-stack shopping app created for demonstration purposes only. No real purchases will be made.  </p>
          <p className="enter-button text-center" onClick={() => props.handleModal()}><span className="highlight">ENTER</span></p>
        </div>
      </div>

    </div>

  );
}

export default LandingPage;
