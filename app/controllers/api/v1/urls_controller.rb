module Api
  module V1
    class UrlsController < ApiController

      # Added index with pagination so when
      # scaling there's no need to retreive
      # all records.
      def index
        @urls = Url.page params[:page]
      end

      def parse
        result = ParseUrl.call(params: params)

        if result.success?
          @tags = result.url.tags
        else
          render json: {errors: result.error.as_json},
            status: :unprocessable_entity
        end
      end
    end
  end
end
