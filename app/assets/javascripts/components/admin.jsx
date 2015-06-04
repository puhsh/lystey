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
        </div>
      </div>
    )
  }
});
