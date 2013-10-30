require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "log-in page" do
  	before { visit login_path }

  	it { should have_content("ログイン") }
  	it { should have_title("ログイン") }
  end

  describe "log-in" do
   	before { visit login_path }

  	describe "with invalid information" do
  	  before { click_button("ログイン") }

  	  it { should have_title("ログイン") }
  	  it { should have_selector('div.alert.alert-error', text: "違います") }

  	  describe "after visiting anotehr page" do
  	  	before { click_link "ホーム" }
  	  	it { should_not have_selector('div.alert.alert-error') }
  	  end
    end

    describe "with valid information" do
  	  let(:user) { FactoryGirl.create(:user) }
  	  before do
  	    fill_in "メール", with: user.email.upcase
  	    fill_in "パスワード", with: user.password
  	    click_button "ログイン"
  	  end

  	  it { should have_title(user.name) }
   	  it { should have_link('ユーザープロファイル', href: user_path(user)) }
   	  it { should have_link('ログアウト', href: logout_path) }
   	  it { should_not have_link('ログイン', href: login_path) }

      describe "followed by logout" do
        before { click_link "ログアウト" }
        it { should have_link("ログイン")}
      end
   	end
  end
end