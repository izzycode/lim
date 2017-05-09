# encoding: utf-8

require "rails_helper"

describe Api::V1::UrlsController do
  render_views
  let!(:url) { create(:url) }
  let!(:tag) { create(:tag, url: url) }

  describe "GET /urls" do
    context "success index request" do
      it "returns success" do
        get :index, params: { format: :json }
        expect(response).to have_http_status(:success)
      end

      it "returns urls's data" do
        get :index, params: { format: :json }
        expect(parsed_response["urls"][0]["value"]).to eq url.value
      end
    end
  end

  describe "POST /urls/parse" do
    context "success parse request" do
      let (:string_url) { 'http://google.com' }

      it "returns success" do
        post :parse, params: { url: string_url, format: :json }
        expect(response).to have_http_status(:success)
      end
    end

    context "error parse request due to invalid url" do
      let (:string_url) { 'invalidurl.com' }

      it "returns error" do
        post :parse, params: { url: string_url, format: :json }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns error's data" do
        post :parse, params: { url: string_url, format: :json }
        expect(parsed_response["errors"]).not_to be nil
      end
    end

  end
end
