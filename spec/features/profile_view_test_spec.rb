require 'rails_helper'

describe "profile view tests" do
    before(:each) do
        user = FactoryGirl.create(:user)
        admin = FactoryGirl.create(:admin)
        visit "login"
        fill_in "Email", :with => "qwerty@example.ca"
        fill_in "Password", :with => "password"
        click_button "Log in"
        expect(current_url).to include "users/"
    end
    
    it "hides postal code when empty" do
        click_link('PROFILE', match: :first)
        expect(page).to_not have_content "Postal Code"
        
        # Add a postal code
        click_link('SETTINGS')
        fill_in 'Postal code', :with => 'a1a1a1'
        click_button 'Save changes'
        expect(page).to have_content "Postal Code"
        expect(page).to have_content "a1a1a1"
    end
    
    it "hides province when empty" do 
        click_link('PROFILE', match: :first)
        expect(page).to_not have_content "State/Province"
        
        # Add a province
        click_link('SETTINGS')
        fill_in 'State', :with => 'BC'
        click_button 'Save changes'
        expect(page).to have_content "State/Province"
        expect(page).to have_content "BC" 
    end
end