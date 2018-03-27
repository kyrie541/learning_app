require 'rails_helper'

RSpec.describe "CreateNewUsers", type: :request do
  describe "create new user" do
    it "sign up" do
      visit root_path
      click_link "Sign up"
      fill_in "Input a User Name", with: "asdfgh"
      fill_in "Input your email", with: "asdfgh@gmail.com"
      fill_in "Create a password", with: "password"
      fill_in "Confirm Password", with: "password"
      click_button "Create Account"
      expect(page).to have_current_path(articles_path)
      expect(page).to have_content "Welcome asdfgh! You successfully created an account!"
    end
  end
end

