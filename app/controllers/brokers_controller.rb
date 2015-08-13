class BrokersController < ApplicationController
  before_filter :find_agent
  before_filter :find_theme, only: [:show]

  def show
  end

  def new
    @broker = @agent.build_broker

    respond_to do |format|
      format.html
    end
  end

  def create
    @broker = @agent.build_broker(broker_params)

    respond_to do |format|
      if @broker.save
        format.html { redirect_to agent_edit_brokers_path }
      else
        format.html {
          flash[:alert] = 'Error'
          render :new
        }
      end
    end
  end

  def edit
    @broker = @agent.broker
    respond_to do |format|
      format.html
    end
  end

  def update
    @broker = @agent.broker

    respond_to do |format|
      if @broker.update_attributes(broker_params)
        format.html { redirect_to agent_edit_brokers_path }
      else
        format.html {
          flash[:alert] = 'Error'
          render :edit
        }
      end
    end
  end

  private

  def broker_params
    params.require(:broker).permit!
  end
end
