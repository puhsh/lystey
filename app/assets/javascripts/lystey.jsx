$(function() {
  var LysteyApp = React.createClass({
    render: function() {
      return (
        <div className="container">
        </div>
      )
    }
  });

  React.render(
    <LysteyApp />, document.getElementById("lystey-app")
  );
});
