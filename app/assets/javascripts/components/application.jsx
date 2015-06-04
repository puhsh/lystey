var LysteyApp = React.createClass({
  render: function() {
    return (
      <div id="wrap">
        <Navigation />
        <section id="panel">
          <div className="container">
            <AdminSection />
          </div>
        </section>
      </div>
    )
  }
});
