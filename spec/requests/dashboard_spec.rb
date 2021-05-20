require 'rails_helper'

RSpec.feature "Reading Dashboard", type: :feature do

  feature "when logged in" do
    let(:admin) { create(:user, :admin) }
    before(:each) { stub_login_as admin }

    scenario "go to dashboard" do
      visit "/dashboard"
      expect(page).to have_content(User.all.count)
      expect(page).to have_content(Story.all.count)
    end
  end
end