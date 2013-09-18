require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_content('統制ツール') }
    it { should have_title(full_title('')) }
    it { should_not have_content('| ホーム') }
  end

  describe "help page" do
    before { visit help_path }

    it { should have_content('ヘルプ') }
    it { should have_title(full_title("ヘルプ")) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('私たちについて') }
    it { should have_title(full_title('私たちについて')) }
  end

  describe "contact page" do
    before { visit contact_path }
    
    it { should have_content('コンタクト') }
    it { should have_title(full_title('コンタクト')) }
  end
end
 





