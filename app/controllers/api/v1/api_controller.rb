module Api
  module V1
    class ApiController < ApplicationController
      # All global configuration for the v1
      # of the API controller goes here.
      protect_from_forgery with: :null_session
    end
  end
end
