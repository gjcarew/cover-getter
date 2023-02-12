
require "rails_helper"

RSpec.describe OpenAI::TextService do
  describe "cover_letter" do
    subject(:service) { OpenAI::TextService.new() }

    context "success" do
      it "returns a cover letter" do
        cover_letter = service.cover_letter("Write a cover letter for a software engineer role at Open AI")

        expect(cover_letter.content.present?).to be(true)
      end
    end
    context "failure", :stub_ai_failure do
      it "raises an error" do
        expect do
          service.cover_letter("Write a cover letter")
        end.to raise_error(OpenAI::APIError, "A wild error appeared!")
      end
    end
  end
end
