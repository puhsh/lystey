class BiographiesController < ApplicationController
  before_filter :find_agent
  before_filter :find_theme, only: [:show]

  def show
  end

  def new
    @biography = @agent.build_biography
    respond_to do |format|
      format.html
    end
  end

  def create
    @biography = @agent.build_biography(biography_params)

    respond_to do |format|
      if @biography.save
        format.html { redirect_to agent_edit_biography_path(@agent) }
      else
        format.html {
          flash[:alert] = 'Error'
          redirect_to new_agent_biography_path(@agent)
        }
      end
    end
  end

  def edit
    @biography = @agent.biography

    respond_to do |format|
      if @biography.present?
        format.html
      else
        format.html { redirect_to new_agent_biography_path(@agent) }
      end
    end
  end

  def update
    @biography = @agent.biography
    respond_to do |format|
      if @biography.update_attributes(biography_params)
        format.html { redirect_to agent_edit_biography_path(@agent) }
      else
        format.html { redirect_to agent_edit_biography_path(@agent) }
      end
    end
  end

  private

  def biography_params
    params.require(:biography).permit!
  end

end
