require "rails_helper"

describe Url do
  it "has a valid factory" do
    expect(FactoryGirl.create(:url)).to be_valid
  end

  it "does not allow to create one url without value" do
    expect(FactoryGirl.build(:url, value: nil)).not_to be_valid
  end

  it "does not allow to create one url with invalid url value" do
    expect(FactoryGirl.build(:url, value: "invalidurl.com")).not_to be_valid
  end
end
