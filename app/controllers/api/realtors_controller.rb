class Api::RealtorsController < Api::BaseController
  def index
    @realtors = Realtor.includes(:addresses).limit(25)
    render :index
  end

  def show
  end
end
