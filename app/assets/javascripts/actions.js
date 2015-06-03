var AgentActions = Reflux.createActions([
  "load"
]);

AgentActions.load.preEmit = function() {
  console.log('1');
}
