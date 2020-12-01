require 'rails_helper'

RSpec.describe Movie, type: :model do
  movie = Movie.new({"name"=>"XYZ", "category"=>"Drama","description"=> "about movie","status"=> true})

  context 'validation test cases' do
    it "is valid with valid attributes" do
      expect(movie).to be_valid
    end
    it "is not valid without a name" do
      movie.name = nil
      expect(movie).to_not be_valid
    end
    it "is not valid without a Category" do
      movie.category = nil
      expect(movie).to_not be_valid
    end
    it "is not valid without a status" do
      movie.status = nil
      expect(movie).to_not be_valid
    end
  end

  context 'movie scope test cases' do
    it "fetch the active movies" do
      active_count = Movie.where(status: true).count
      expect(Movie.active.count).eql? active_count
    end
  end
end
