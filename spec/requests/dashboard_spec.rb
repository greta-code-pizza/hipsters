require 'rails_helper'

RSpec.feature "Reading Dashboard", type: :feature do

  feature "when logged in" do
    let(:user) { create(:user) }
    let(:admin) { create(:user, :admin) }

    scenario "go to dashboard with admin user" do
      stub_login_as admin
      
      visit "/dashboard"
      expect(page).to have_content(User.all.count)
      expect(page).to have_content(Story.all.count)
    end

    scenario "go to login with standard user" do
      stub_login_as user
      
      visit "/dashboard"
      expect(page).to have_css(".flash-error")
    end

    scenario "go to login with unlogged user" do
      visit "/dashboard"
      expect(page).to have_selector("form")
      expect(page).to have_field("email")
    end
  end
end

