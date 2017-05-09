# encoding: utf-8

require "rails_helper"

describe ParseUrl do
  let(:result) { ParseUrl.call(context) }

  describe ".call" do
    context "valid url parameter" do
      let(:context) {
        { params: { url: 'https://google.com' } }
      }

      it "should return a valid url model created" do
        expect(result.url).to be_valid
      end

      it "shouldn't rise any error" do
        expect(result.error).to be_nil
      end
    end

    context "valid url synthax parameter but invalid web url" do
      let(:context) {
        { params: { url: 'https://correctsynthaxincorrecturl.com' } }
      }

      it "should return a valid url model created" do
        expect(result.url).to be_nil
      end

      it "shouldn't rise any error" do
        expect(result.error).not_to be_nil
      end
    end

    context "invalid url synthax" do
      let(:context) {
        { params: { url: 'inccorrectsynthaxurl.qppkak' } }
      }

      it "should return a valid url model created" do
        expect(result.url).to be_nil
      end

      it "shouldn't rise any error" do
        expect(result.error).not_to be_nil
      end
    end
  end

end
