# Builds a prompt from a job and a profile
class PromptBuilder

  def initialize(job, profile)
    @job = job
    @profile = profile
  end

  def text
    "Write me a cover letter. \n" +
      "The company is #{@job.company}. \n" +
      "The job title is #{@job.role}. \n" +
      description + 
      skills +
      experience + 
      education + 
      projects
  end

  private

  def description
    if @job.description
      "This is the job description: #{@job.description} \n"
    else
      ''
    end
  end

  def skills
    if @profile.skills
      "These are my skills: #{@profile.skills} \n"
    else
      ''
    end
  end

  def experience
    if @profile.experience
      "This is my relevant experience: #{@profile.experience} \n"
    else
      ''
    end
  end

  def projects
    if @profile.projects
      "These are projects I've worked on: #{@profile.projects}"
    else
      ''
    end
  end

  def education
    if @profile.education
      "This is my education: #{@profile.education} \n"
    else
      ''
    end
  end
end