require 'rails_helper'

RSpec.describe Show, type: :model do

  before(:all) do
    DatabaseCleaner.start
    Movie.delete_all
    Show.delete_all
    @movie = Movie.create!({"id"=>33,"name"=>"XYZ", "category"=>"Drama","description"=> "about movie","status"=> true})
    @show = Show.new({"movie_id"=>@movie.id, "show_date"=> Time.now + 2.days, "show_slot"=> %w[12-3 4-7 8-11]})
  end

  after(:all) do
    DatabaseCleaner.clean
  end


  context 'validation test cases' do
    it "is valid with valid attributes" do
      expect(@show).to be_valid
    end
    it "is not valid without a movie_id" do
      @show.movie_id = nil
      expect(@show).to_not be_valid
    end
    it "is not valid without a show date" do
      @show.show_date = nil
      expect(@show).to_not be_valid
    end
    it "is not valid without a show slot" do
      @show.show_slot = nil
      expect(@show).to_not be_valid
    end
  end

  context 'show scope test cases' do
    it "fetch the valid shows" do
      Show.create!({"movie_id"=>@movie.id, "show_date"=> Time.now + 2.days, "show_slot"=> %w[12-3 4-7 8-11]})
      expect(Show.valid.count).to be >= 1
    end
  end
end
