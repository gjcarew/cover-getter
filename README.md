<div align="center"><img src="placeholder" style="width: 150px;"> 

# **Cover Getter**

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) ![ror](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) 

### Contributors: 
[Autumn Martin](https://github.com/Autumn-Martin) | 
[Gavin Carew](https://github.com/gjcarew) 
</div>

--- 

## **Writing cover letters sucks.** 

Nobody enjoys writing cover letters, but it's something all job hunters have to do. **Cover Getter** is here to make your life easier. 

## **Cover Getter** uses **artificial intelligence** to write a cover letter based on a user's profile and a job description. 

Your profile can be as detailed as a full CV or just a sentence or two, **Cover Getter** doesn't care. It will write you a professional and ATS-optimized custom cover letter in seconds. 

Don't like the the letter that was generated? Re-generate to get a different response. Make any edits you like and save your cover letters for later.  

## **Cover Getter** is ready to monetize.

There is proven demand for cover letter writing services. **Cover Getter** could be monetized as either a tiered subscription service or allow users to pay on a per-letter basis.

---
## <a name="contents"></a> Try it yourself
[Setup](#setup)

[API keys](#required-keys)

[Using the app](#using)

[Disclaimer](#disclaimer)

---

## <a name="setup"></a> Setup
[Back to top](#contents)


**Cover Getter** was built on 2.7.4 and Rails 5.2.8. To get started, fork and clone the repo and run `bundle install` to get the [required gems](Gemfile). 

**Cover Getter** uses a PostgreSQL database. Set up the database by running `bundle exec rake db:{create,migrate}` in your terminal.

---

## <a name="required-keys"></a> API keys
[Back to top](#contents)

**Cover Getter** calls OpenAI's DaVinci service in order to generate cover letters. Before generating cover letters, you will need to log in to a free OpenAI account and [get your API keys](https://platform.openai.com/account/api-keys).

Once you have your keys, save them as an environment variable - [example here](.env.sample).

Finally, start a rails server with `rails s` and visit http://localhost:3000/ to get started.

---
## <a name="using"></a> Using the app
[Back to top](#contents)

You can sign in with an email and password or with a LinkedIn account. 

To get the best results when building your profile, we recommend taking the skills, education, projects, and experience sections straight from your resume and pasting them here. If the format looks weird after pasting, that's a sign that your resume is going to struggle to make it through applicant tracking systems (ATS's) and you may want to simplify your formatting.

In general, the more detailed your profile is, the easier it will be to match your profile to keywords found in a job listing. This means the cover letter that is generated will be more tailored to your personal skills and experience.

When creating a cover letter, we again recommend copying and pasting directly from the job description. 

## <a name="disclaimer"></a> Disclaimer
[Back to top](#contents)

Read your cover letter. 

**Cover Getter** is built on the [GPT-3 model](https://en.wikipedia.org/wiki/GPT-3). That means it generates text that sounds plausible, but may not be factual. 

We provide tools allow you to edit the cover letter that is generated to make sure it matches up with your actual skills, experience, and education. It's up to you to proofread your cover letter and fix any mistakes. 

