var MainNav = React.createClass({
  componentDidMount: function() {
    this.slideout = new Slideout({
      'panel': document.getElementById('panel'),
      'menu': document.getElementById('menu'),
      'padding': 256,
      'tolerance': 70
    });
  },

  toggleMenu: function() {
    this.slideout.toggle();
  },

  render: function() {
    return (
      <div className="container">
        <div className="row nav-bar">
          <div className="twelve columns">
            <a href="#" className="nav-menu-toggle" onClick={this.toggleMenu}>
              <i className="fa fa-bars fa-3x"/>
            </a>
            <div id="nav-heading">
              <h2 className="heading-text"> Firstname Lastname </h2>
              <h3 className="heading-text"> Real Estate </h3>
            </div>
            <div id="nav-contact-items">
              <a href="#">
                <i className="fa fa-envelope fa-2x fa-fw red"/>
              </a>
              <a href="#">
                <i className="fa fa-phone-square fa-2x fa-fw red" id="phone"/>
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  }
});

var AdminNav = React.createClass({
  render: function() {
    return (
      <div className="shaded-section">
        <div className="container">
          <div className="row nav-section">
            <div className="twelve columns">
              <h2> Admin Section: </h2>
            </div>
          </div>
        </div>
      </div>
    )
  }
});
