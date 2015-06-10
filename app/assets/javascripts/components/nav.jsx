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
      <section className="container section">
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
            </div>
          </div>
        </div>
      </section>
    );
  }
});

var AdminNav = React.createClass({
  render: function() {
    return (
      <section className="shaded-section">
        <div className="container section">
          <div className="row">
            <div className="twelve columns">
              <h2> Admin Section: </h2>
            </div>
          </div>
          <div className="row">
            <div className="twelve columns">
              <select className="u-full-width nav-select">
                <option value="1">
                  About Section
                </option>
              </select>
              <button className="button button-primary nav-button">Go</button>
            </div>
          </div>
        </div>
      </section>
    )
  }
});
