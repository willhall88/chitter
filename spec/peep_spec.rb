require "peep"

describe Peep do
  it "should have a peep when it is created" do
    expect (Peep.count).to eq 0
    Peep.create(:peep => "this is a peep")
    expect (Peep.count).to eq 1
  end


end