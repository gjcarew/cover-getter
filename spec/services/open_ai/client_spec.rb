
require "rails_helper"

RSpec.describe OpenAI::Client do
  describe "post" do
    subject(:client) { OpenAI::Client.new() }

    context "success" do
      it "returns text", :unstubbed do
        body = {
          "model": "text-davinci-003",
          "temperature": 0.6,
          "top_p": 1.0,
          "max_tokens": 256,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
          "prompt": "Write a cover letter for a software engineer role at Open AI"
        }

        res = client.post(action: "completions", body: body)

        expect(res.body["error"]).to be(nil)
        expect(res.status).to eq(200)

        content = JSON.parse(res.body)["choices"][0]["text"]
        expect(content.blank?).to be(false)
      end
    end

    context "failure" do
      it "returns an error message", :unstubbed do
        body = {
          "temperature": 0.6,
          "top_p": 1.0,
          "max_tokens": 256,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
          "prompt": "Write a cover letter for a software engineer role at Open AI"
        }

        res = client.post(action: "completions", body: body)

        expect(res.body["error"]).to_not be(nil)
        expect(res.status).to eq(400)
      end
    end
  end
end
