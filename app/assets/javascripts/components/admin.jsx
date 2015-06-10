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
          <AdminNav />
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
          <h1>{this.props.sectionName}</h1>
        </div>
      </div>
    )
  }
});
