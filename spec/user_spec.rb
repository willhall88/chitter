require_relative "spec_helper"

describe User do

  it "should have a name when it is created" do
    expect(User.count).to eq 0
    User.create(:name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
    expect(User.count).to eq 1
  end

  it "should have a username when it is created" do
    expect(User.count).to eq 0
    User.create(:name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
    expect(User.count).to eq 1
  end

  it "should have a email when it is created" do
    expect(User.count).to eq 0
    User.create(:name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
    expect(User.count).to eq 1
  end

  it "should have a unique secure password" do
    expect(User.count).to eq (0)
    user = User.create( :name => "Will", 
                        :email => "willhall88@hotmail.com",
                        :username => "willhall88", 
                        :password => "password123",  
                        :password_confirmation => "password123")
    expect(User.count).to eq (1)
    user = User.create(:name => "Will", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password456")
    expect(User.count).to eq (1)
  end 

  it "should have a unique email address" do
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :username => "willhall88", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
    user = User.create(:name => "Will", :username => "willhall88", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
  end

    it "should have a unique username" do
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :username => "willhall88", :email => "email", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
    user = User.create(:name => "Will", :username => "willhall88", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (1)
  end

  it"should have required input fields upon creation" do
    expect(User.count).to eq (0)
    user = User.create(:name => "", :username => "willhall88", :email => "email", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :username => "", :email => "willhall88@hotmail.com", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (0)
    user = User.create(:name => "Will", :username => "willhall88", :email => "", :password => "password123", :password_confirmation => "password123")
    expect(User.count).to eq (0)
  end

end