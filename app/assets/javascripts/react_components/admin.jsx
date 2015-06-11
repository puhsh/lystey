var LysteyAdmin = React.createClass({
  render: function() {
    return (
      <div>
        <Menu />
        <AdminSection />
      </div>
    )
  }
});

var AdminSection = React.createClass({
  render: function() {
    return (
      <div id="panel">
        <div>
          <MainNav />
          <AdminSectionNav />
          <section className="container section">
            <AdminContent sectionName="General Info" />
          </section>
        </div>
      </div>
    )
  }
});


var AdminContent = React.createClass({
  render: function() {
    return (
      <div className="row">
        <div className="twelve columns">
          <h1 className="section-heading">{this.props.sectionName}</h1>
          <form className="form">
            <div className="row">
              <div className="twelve columns">
                <input placeholder="First Name" type="text" className="u-full-width" />
                <input placeholder="Last Name" type="text" className="u-full-width" />
                <input placeholder="Suffix" type="text" className="u-full-width" />
                <input placeholder="License Number" type="text" className="u-full-width" />
                <input placeholder="License Type" type="text" className="u-full-width" />
                <input placeholder="License Country" type="text" className="u-full-width" />
              </div>
            </div>
          </form>
        </div>
      </div>
    )
  }
});
