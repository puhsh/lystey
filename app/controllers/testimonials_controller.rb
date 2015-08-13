class TestimonialsController < ApplicationController
  before_filter :find_agent
  before_filter :find_theme
  before_filter :show_footer

  def index
    @testimonials = @agent.testimonials.order(created_at: :desc)
    respond_to do |format|
      format.html
    end
  end
end
