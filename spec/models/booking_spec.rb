require 'rails_helper'

RSpec.describe Booking, type: :model do
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


  context 'validation test cases' do
    it "is valid with valid attributes" do
      expect(@booking).to be_valid
    end
    it "is not valid without a screening_id" do
      @booking.screening_id = nil
      expect(@booking).to_not be_valid
    end
    it "is not valid without a name" do
      @booking.name = nil
      expect(@booking).to_not be_valid
    end
    it "is not valid without a email" do
      @booking.email = nil
      expect(@booking).to_not be_valid
    end
    it "is not valid without a mobile_number" do
      @booking.mobile_number = nil
      expect(@booking).to_not be_valid
    end
    it "is not valid without a booked_seats" do
      @booking.booked_seats = nil
      expect(@booking).to_not be_valid
    end
  end

  context 'callback test cases' do
    it "update the screening seats based on booked seats" do
      @booking = Booking.create!({"screening_id"=>@screening.id, "name"=>"sahendra", "email"=>"sahi@gmail.com", "mobile_number"=>"987452136", "booked_seats"=>[21, 22, 23], "amount"=> 450})
      expect(@booking).to receive(:update_screening)
      @booking.run_callbacks(:commit)
    end
  end
end
