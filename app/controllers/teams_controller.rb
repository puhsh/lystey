class TeamsController < ApplicationController
  before_filter :find_agent

  def show
  end

  def edit
    @theme = @agent.theme
    @team = @agent.team || @agent.build_team
    @team_members = @agent.team_members

    if @team_members.empty?
      @agent.team_members.build(team: @team)
    end

    respond_to do |format|
      format.html
    end
  end

  private

  def find_agent
    id = params[:agent_id] || params[:id]
    @agent = Agent.friendly.find(id)
  end
end
