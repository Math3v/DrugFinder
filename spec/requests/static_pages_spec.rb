require 'spec_helper'

describe "StaticPages" do

  describe "Contact page" do
    it "should have the content 'Kontakt'" do
      visit '/contact'
      page.should have_content('Kontakt')
    end
  end

  describe "Stats page" do
    it "should have the content 'tatistiky'" do
      visit '/stats'
      page.should have_content('tatistiky')
    end 
  end 

  describe "About page" do
    it "should have the content 'Slovenskej'" do
      visit '/about'
      page.should have_content('Slovenskej')
    end
  end

  describe "Human Body page" do
    it "should have the content 'Kliknite'" do
      visit '/human_body'
      page.should have_content('Kliknite')
    end
  end

  describe "Signin page" do
    it "should have the content 'Zadajte'" do
      visit '/signin'
      page.should have_content('Meno')
    end
  end

  describe "Find producers" do
    it "should have the content 'robcu'" do
      visit '/find_producers'
      page.should have_content('robcu')
    end
  end

  describe "Find holders" do
    it "should have response" do
      get '/find_holders'
      response.status.should be(200)
    end
  end

  describe "Find suppliers" do
    it "should have response" do
      get '/find_suppliers'
      response.status.should be(200)
    end
  end
end
