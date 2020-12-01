require 'rails_helper'

RSpec.describe Screening, type: :model do
  before(:all) do
    DatabaseCleaner.start
    Movie.delete_all
    Show.delete_all
    Screening.delete_all
    @movie = Movie.create!({"id"=>33,"name"=>"XYZ", "category"=>"Drama","description"=> "about movie","status"=> true})
    @show = Show.create!({"movie_id"=>@movie.id, "show_date"=> Time.now + 2.days, "show_slot"=> %w[12-3 4-7 8-11]})
    @screening = Screening.new({"show_id"=>@show.id, "rows"=>10, "total_seats"=>100, "reserved_seats"=>[1, 2, 13, 14, 15, 16, 17, 18, 19, 20]})
  end

  after(:all) do
    DatabaseCleaner.clean
  end


  context 'validation test cases' do
    it "is valid with valid attributes" do
      expect(@screening).to be_valid
    end
    it "is not valid without a show_id" do
      @screening.show_id = nil
      expect(@screening).to_not be_valid
    end
    it "is not valid without a rows" do
      @screening.rows = nil
      expect(@screening).to_not be_valid
    end
    it "is not valid without a total_seats" do
      @screening.total_seats = nil
      expect(@screening).to_not be_valid
    end
  end
end
