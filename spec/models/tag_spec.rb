require "rails_helper"

describe Tag do
  it "has a valid factory" do
    expect(FactoryGirl.create(:tag)).to be_valid
  end

  it "does not allow to create one tag without name" do
    expect(FactoryGirl.build(:tag, name: nil)).not_to be_valid
  end

  it "does not allow to create one tag without content" do
    expect(FactoryGirl.build(:tag, content: nil)).not_to be_valid
  end
end
