require 'rails_helper'

RSpec.describe :PromptBuilder do 
  it 'Generates a prompt from a job and a profile' do 
    user = User.create!(email: 'example@user.com', password: 'ValidPW')
    Profile.create!(user_id: user.id, 
                skills: 'Ruby',
                experience: 'I worked at Amazon as a software engineer',
                education: 'Turing School of Software and Design',
                projects: 'Cover Getter, a rails project using ChatGPT')
    job = Job.new(role: 'Software engineer',
                  company: 'Google',
                  description: 'Make a search engine')
    prompt = PromptBuilder.new(job, user.profile)

    expect(prompt).to be_a PromptBuilder
    expect(prompt.text).to eq("Write me a cover letter in 500 words or fewer. \nThe company is Google. \nThe job title is Software engineer. \nThis is the job description: Make a search engine \nThese are my skills: Ruby \nThis is my relevant experience: I worked at Amazon as a software engineer \nThis is my education: Turing School of Software and Design \nThese are projects I've worked on: Cover Getter, a rails project using ChatGPT")
  end
  
  it 'Can generate a prompt with an incomplete job and profile' do
    user = User.create!(email: 'example@user.com', password: 'ValidPW')
    Profile.create!(user_id: user.id)
    job = Job.new(role: 'Software engineer',
      company: 'Google')
      prompt = PromptBuilder.new(job, user.profile)

      expect(prompt.text).to eq("Write me a cover letter in 500 words or fewer. \nThe company is Google. \nThe job title is Software engineer. \n")
  end
end
