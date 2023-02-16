require "feature_helper"

RSpec.describe "Profile editing", type: :feature do
  let(:user) { User.create(email: "test@example.com", password: "verysecurepassword123", password_confirmation: "verysecurepassword123") }

  before { login_as(user) }

  context "signed in users" do
    it "can edit their profile" do
      previous = OpenStruct.new(
        skills: "Exploring",
        experience: "Digital Dreamweaver Computer Conjuror DevOps Dynamo Algorithm Alchemist",
        education: "Artificial Intelligence",
        projects: "CoverGetter"
      )
      Profile.create(user_id: user.id, skills: previous.skills, experience: previous.experience, education: previous.education, projects: previous.projects)

      visit home_index_path
      click_on "Edit Profile"

      expect(page).to have_current_path(edit_profile_path())

      updated = "Code Composer Program Poet Software Samurai"
      fill_in "Experience", with: updated, fill_options: { clear: :backspace }
      click_on "Submit"

      expect(page).to have_content("Home")

      profile = user.profile.reload

      expect(user.nil?).to be(false)
      expect(profile.nil?).to be(false)
      expect(profile.experience).to eq(updated)
      expect(profile.skills).to eq(previous.skills)
      expect(profile.education).to eq(previous.education)
      expect(profile.projects).to eq(previous.projects)
    end
  end
end
