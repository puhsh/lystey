class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def find_agent
    id = params[:agent_id] || params[:id]
    @agent = Agent.friendly.find(id)
  end

  def find_theme
    if @agent
      @theme = @agent.theme
    end
  end

  def show_footer
    @show_footer = true
  end
end
