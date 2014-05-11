require_relative "spec_helper"

describe Peep do

  it "should have a peep when it is created" do
    user = User.create(:name => "Will")
    expect(Peep.count).to eq 0
    Peep.create(:peep => "this is a peep", :user_id => user.id)
    expect(Peep.count).to eq 1
  end

  it "should belong to a user when it is created" do
    user = User.create(:name => "Will")
    peep = Peep.create(:peep => "this is a peep", :user_id => user.id)
    expect(peep.user.name).to eq ("Will")

  end

end