require 'rails_helper'

RSpec.describe Admin, type: :model do
  before(:all) do
    DatabaseCleaner.start
  end

  after(:all) do
    DatabaseCleaner.clean
  end
  admin = Admin.new({"name"=>"Admin", "email"=>"admin@gmail.com","password"=> "123456","password_confirmation"=> "123456"})

  context 'validation test cases' do
    it "is valid with valid attributes" do
      expect(admin).to be_valid
    end
    it "is not valid without a name" do
      admin.name = nil
      expect(admin).to_not be_valid
    end
    it "is not valid without a email" do
      admin.email = nil
      expect(admin).to_not be_valid
    end
    it "is not valid without a password" do
      admin.password = nil
      expect(admin).to_not be_valid
    end
    it "is not valid without a password_confirmation" do
      admin.password_confirmation = nil
      expect(admin).to_not be_valid
    end
  end
end
