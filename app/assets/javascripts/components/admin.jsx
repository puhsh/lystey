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
          <div className="container">
            <AdminContent sectionName="General Info" />
          </div>
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
