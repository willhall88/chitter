require_relative "spec_helper"

describe User do

  it "should have a name when it is created" do
    expect(User.count).to eq 0
    User.create(:name => "Will")
    expect(User.count).to eq 1
  end

  it "should have a username when it is created" do
    expect(User.count).to eq 0
    User.create(:name=> "Will", :username => "will")
    expect(User.count).to eq 1
  end

  it "should have a email when it is created" do
    expect(User.count).to eq 0
    User.create(:name=> "Will", :username => "will", :email => "will@test.com")
    expect(User.count).to eq 1
  end

  it "should have a unique secure password" do
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
    user = User.create(:name => "Will", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password456")
    expect(User.count).to eq (1)
  end 

  it "should have a unique email address" do
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
    user = User.create(:name => "Will", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
  end

end