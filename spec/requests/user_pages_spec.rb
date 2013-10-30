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

      describe "after submition" do
        before { click_button submit }
        it { should have_title("ユーザー登録") }
        it { should have_content("エラー") }
      end
  	end

  	describe "with valid information" do
  	  before do
  	  	fill_in "名前",      with: "oki"
  	  	fill_in "メール",    with: "oki@email.com"
  	  	fill_in "パスワード", with: "foobar"
  	  	fill_in "パスワード(再入力)",   with: "foobar"
  	  end

  	  it "should create user" do
  	  	expect { click_button submit }.to change(User, :count).by(1)
  	  end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: "oki@email.com") }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: "ユーザーを追加しました") }
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