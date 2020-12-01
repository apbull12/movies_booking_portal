require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  before(:all) do
    DatabaseCleaner.start
    Movie.delete_all
    Show.delete_all
    Screening.delete_all
    Booking.delete_all
    @movie = Movie.create!({"id"=>33,"name"=>"XYZ", "category"=>"Drama","description"=> "about movie","status"=> true})
    @show = Show.create!({"movie_id"=>@movie.id, "show_date"=> Time.now + 2.days, "show_slot"=> %w[12-3 4-7 8-11]})
    @screening = Screening.create!({"show_id"=>@show.id, "rows"=>10, "total_seats"=>100, "reserved_seats"=>[1, 2, 13, 14, 15, 16, 17, 18, 19, 20]})
    @booking = Booking.new({"screening_id"=>@screening.id, "name"=>"sahendra", "email"=>"sahi@gmail.com", "mobile_number"=>"987452136", "booked_seats"=>[21, 22, 23], "amount"=> 450})
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "GET index" do
    it "should list all the bookings" do
     @booking.save
      get '/booking/show'
      expect(assigns(:bookings)).to eq([@booking])
    end

    it "Should Download CSV" do
      get '/booking/export.csv'
      expect(response).to have_http_status(:ok)
    end

    it "Should Download invoice for particular booking" do
      url = "/booking/#{@booking.id}/invoice/download"
      get url
      expect(response).to have_http_status(:ok)
    end
  end
end
