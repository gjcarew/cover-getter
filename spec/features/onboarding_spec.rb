require "feature_helper"

RSpec.describe "Onboarding", type: :feature do
  let(:input) do
    OpenStruct.new(
      email: "test@example.com",
      password: "verysecurepassword123",
      skills: "Exploring",
      experience: "Digital Dreamweaver Computer Conjuror DevOps Dynamo Algorithm Alchemist",
      education: "Artificial Intelligence",
      projects: "CoverGetter"
    )
  end

  context "new user" do
    it "can complete onboarding flow and sign in" do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)

      click_on "Sign up"

      expect(page).to have_current_path(new_user_registration_path)

      fill_in "Email", with: input.email
      fill_in :user_password, with: input.password
      fill_in "Password confirmation", with: input.password
      click_on "Sign up"

      expect(page).to have_current_path(new_profile_path)
      expect(page).to have_content("New Profile")
      expect(page).to_not have_link(edit_profile_path) # Nav link that displays after profile creation

      fill_in "Skills", with: input.skills
      fill_in "Experience", with: input.experience
      fill_in "Education", with: input.education
      fill_in "Projects", with: input.projects
      click_on "Submit"

      expect(current_path).to eq(home_index_path)

      user = User.find_by(email: input.email)
      profile = user.profile

      expect(user.nil?).to be(false)
      expect(profile.nil?).to be(false)
      expect(profile.skills).to eq(input.skills)
      expect(profile.experience).to eq(input.experience)
      expect(profile.education).to eq(input.education)
      expect(profile.projects).to eq(input.projects)

      click_on "Log Out"

      expect(page).to have_content("Log in")

      fill_in "Email", with: input.email
      fill_in "Password", with: input.password
      click_on "Log in"

      expect(current_path).to eq(root_path)
    end

    it "can sign out without completing onboarding" do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)

      click_on "Sign up"

      expect(page).to have_current_path(new_user_registration_path)

      fill_in "Email", with: input.email
      fill_in :user_password, with: input.password
      fill_in "Password confirmation", with: input.password
      click_on "Sign up"

      expect(page).to have_current_path(new_profile_path)
      expect(page).to have_content("New Profile")
      expect(page).to_not have_link(edit_profile_path) # Nav link that displays after profile creation

      click_on "Log Out"

      expect(page).to have_content("Log in")
    end
  end

  context "returning new user" do
    let(:user) { User.create(email: input.email, password: input.password, password_confirmation: input.password) }

    before { login_as(user) }

    it "is shown the home page if they've already made a profile" do
      user.tap do |u|
        Profile.create(user_id: user.id, skills: input.skills, experience: input.experience, education: input.education, projects: input.projects)
      end

      visit home_index_path

      expect(page).to have_current_path(home_index_path)
      # expect(page).to have_content("Home") 
      expect(page).to have_content("Edit Profile")
    end

    it "is directed to continue onboarding if profile is missing" do
      visit root_path

      expect(page).to have_current_path(new_profile_path)
    end
  end
end
