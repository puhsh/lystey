var Navigation = React.createClass({
  render: function() {
    return(
      <nav id="menu" className="navigation">
        <div className="container">
          <div className="row">
            <div className="twelve columns">
              <a href="#" className="nav-menu">
                <i className="fa fa-bars fa-3x"/>
              </a>
              <div id="nav-heading">
                <h2 className="heading-text"> Firstname Lastname </h2>
                <h3 className="heading-text"> Real Estate </h3>
              </div>
            </div>
          </div>
        </div>
      </nav>
    )
  }
});
