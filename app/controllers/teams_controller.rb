class TeamsController < ApplicationController
  before_filter :find_agent

  def show
  end

  def edit
    @theme = @agent.theme
    @team = @agent.team || @agent.build_team
    @team_members = @team.team_members
    @team_openings = @team.team_openings

    if @team_members.empty?
      @team.team_members.build
    end

    if @team_openings.empty?
      @team.team_openings.build
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
