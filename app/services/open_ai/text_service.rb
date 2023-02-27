module OpenAI
  class TextService
    URL_PREFIX = "https://api.openai.com/v1/".freeze

    def initialize(client: Client.new)
      @client = client
    end

    def cover_letter(prompt)
      request_body = defaults.merge({"prompt": prompt})
      response = client.post(action: "completions", body: request_body)
      response_body = JSON.parse(response.body)

      raise APIError.new(response_body["error"]["message"]) if response.status != 200 && response_body["error"] != nil

      CoverLetter.new(content: response_body["choices"][0]["text"])
    end

    private

    attr_reader :client

    def defaults
      {
        "model": "text-davinci-003",
        "temperature": 0.6,
        "top_p": 1.0,
        "max_tokens": 700,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0
      }
    end
  end
end
