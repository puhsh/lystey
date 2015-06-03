var AgentStore = Reflux.createStore({
  listenables: [AgentActions],

  init: function () {
    this.listenTo(AgentActions.load, this.fetchAgent);
  },

  getInitialState: function () {
    this.agent = {};
    return this.agent;
  },

  fetchAgent: function () {
    $.get("/agents/registered-agent.json", function(data) {
      this.agent = data;
    }).bind(this);
  }
});
