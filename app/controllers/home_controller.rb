class HomeController < ApplicationController
  def show
    @shows_id = Show.valid.order(show_date: :desc).pluck(:id)
    @screenings = Screening.where(show_id: @shows_id)
    render 'home/show'
  end

  def booking
    @screen = Screening.find_by(id: params[:screen_id])
    render 'booking/index'
  end
end
