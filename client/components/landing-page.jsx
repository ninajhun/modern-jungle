import React from 'react';

function LandingPage(props) {
  return (
    <div >
      <p className="welcome-text text-center">welcome to </p>
      <p className="title-text text-center"><span className="highlight">Urban</span> Jungle</p>
      <p className="title-description text-center">This website is for demonstration purposes only of a full-stack shopping website. </p>
      <p className="title-description text-center"> No real purchases will be made. </p>
      <p className="enter-button text-center" onClick={() => props.setView('catalog', {})}><span className="highlight">ENTER</span></p>
    </div>
  );
}

export default LandingPage;
