class TeamOpeningsController < ApplicationController
  before_filter :find_agent
  before_filter :find_theme, only: [:index]
  before_filter :show_footer

  def index
    @team = @agent.team
    @team_openings = @team.team_openings
    respond_to do |format|
      format.html
    end
  end
end
