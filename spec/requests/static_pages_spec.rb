require 'spec_helper'

describe "StaticPages" do
  describe "home page" do
    it "should have content '統制ツール'" do
    	visit '/static_pages/home'
    	expect(page).to have_content('統制ツール')
    end

    it "should have right title" do
      visit '/static_pages/home'
      expect(page).to have_title('統制ツール|ホーム')
    end


  end

  describe "help page" do
    it "should have content 'ヘルプ'" do
    	visit '/static_pages/help'
    	expect(page).to have_content('ヘルプ')
    end

    it "should have right title" do
      visit '/static_pages/help'
      expect(page).to have_title('統制ツール|ヘルプ')
    end
  end

  describe "About page" do
    it "should have content '私たちについて'" do
      visit '/static_pages/about'
      expect(page).to have_content('私たちについて')
    end

    it "should have right title" do
      visit '/static_pages/about'
      expect(page).to have_title('統制ツール|私たちについて')
    end
  end
end

    	
 





