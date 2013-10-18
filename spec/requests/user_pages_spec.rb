require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe 'ユーザー登録' do
  	before { visit signup_path }

  	let(:submit) { ("登録") }

  	it { should have_content('ユーザー登録') }
  	it { should have_title(full_title('ユーザー登録')) }

  	describe "with invalid information" do
  	  it "should not create user" do
  	  	expect { click_button submit }.not_to change(User, :count)
  	  end
  	end

  	describe "with valid information" do
  	  before do
  	  	fill_in "名前",      with: "oki"
  	  	fill_in "メール",    with: "oki@abc.com"
  	  	fill_in "パスワード", with: "foobar"
  	  	fill_in "もう一度",   with: "foobar"
  	  end

  	  it "should create user" do
  	  	expect { click_button submit }.to change(User, :count).by(1)
  	  end
  	end
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_title(user.name) }
    it { should have_content(user.name) }
  end
 end