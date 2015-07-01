class ThemesController < ApplicationController
  before_filter :find_agent

  def edit
    @theme = @agent.theme

    respond_to do |format|
      format.html
    end
  end

  def update
    @theme = @agent.theme
    respond_to do |format|
      if @theme.update_attributes(theme_params)
        format.html { redirect_to agent_edit_themes_path }
      else
        format.html { redirect_to agent_edit_themes_path }
      end
    end
  end

  def destroy
    @theme = @agent.theme
    @theme.reset!

    respond_to do |format|
      format.html { redirect_to agent_edit_themes_path }
    end
  end

  private

  def find_agent
    id = params[:agent_id] || params[:id]
    @agent = Agent.friendly.find(id)
  end

  def theme_params
    params.require(:theme).permit!
  end
end
