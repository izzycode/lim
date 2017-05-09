module Helpers
  # Helper method to parse a response
  #
  # @return [Hash]
  def parsed_response
    JSON.parse(response.body)
  end
end
