module OpenAI
  class Client
    def initialize(url: URL_PREFIX)
      @url = url
    end

    def post(action:, body:, headers: default_headers)
      conn.post(action) do |req|
        req.headers = headers
        req.body = body.to_json
      end
    end

    private

    def conn
      @conn ||= Faraday.new do |c|
        c.adapter(Faraday.default_adapter)
        c.url_prefix = URL_PREFIX
      end
    end

    def default_headers
      {
        "Authorization": "Bearer #{Rails.application.credentials[:OPEN_AI_KEY]}",
        "Content-Type": "application/json"
      }
    end
  end
end
