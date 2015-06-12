class BrokersController < ApplicationController
  before_filter :find_agent

  def show
  end

  def new
    @broker = @agent.broker || @agent.build_broker

    respond_to do |format|
      if @broker.new_record?
        format.html
      else
        format.html { redirect_to edit_agent_broker_path(@agent, @broker) }
      end
    end
  end

  def create
    @broker = @agent.build_broker(broker_params)
    respond_to do |format|
      if @broker.save
        format.html { redirect_to edit_agent_broker_path(@agent, @broker) }
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
        format.html { redirect_to edit_agent_broker_path(@agent, @broker) }
      else
        format.html {
          flash[:alert] = 'Error'
          render :edit
        }
      end
    end
  end

  private

  def find_agent
    @agent = Agent.friendly.find(params[:agent_id])
  end

  def broker_params
    params.require(:broker).permit!
  end
end
