require 'json'

module Stubber
  def stub_open_ai_completions_text(success: true)
    if success
      JSON.generate({
        "id": "5tu6-0p3nA1-t3xt-dav1nc1-003",
        "object": "text_completion",
        "created": 1676187649,
        "model": "text-davinci-003",
        "choices": [
            {
              "text": "\n\nDear Open AI Hiring Team,\n\nI am writing to apply for the Software Engineer role at Open AI. With a degree in Computer Science and five years of experience in software engineering, I am confident that I am the ideal candidate for the job.\n\nAs a software engineer, I have worked on a number of projects for a variety of clients. I have experience developing web applications, mobile apps, and other software solutions. My experience also includes working with databases, designing user interfaces, and debugging code. I am highly skilled in a range of programming languages, including C++, Java, and Python.\n\nI am passionate about artificial intelligence and am excited to join a company like Open AI, which is at the forefront of this technology. I am confident that my skills, experience, and enthusiasm would make me a valuable asset to your team.\n\nI am excited to learn more about the position and discuss how I can contribute to Open AI’s success. Thank you for your time and consideration.\n\nSincerely,\n\n[Your Name]",
              "index": 0,
              "logprobs": nil,
              "finish_reason": "stop"
            }
        ],
        "usage": {
          "prompt_tokens": 12,
          "completion_tokens": 218,
          "total_tokens": 230
        }
      })
    else
      JSON.generate({
        "error": {
          "message": "A wild error appeared!",
          "type": "invalid_request_error",
          "param": nil,
          "code": nil
        }
      })
    end
  end
end
