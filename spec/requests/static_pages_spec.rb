require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end


  describe "home page" do
    before { visit root_path }
    it { should_not have_content('| ホーム') }
  end

  describe "help page" do
    before { visit help_path }

    let(:heading) { 'ヘルプ' }
    let(:page_title) { 'ヘルプ' }

    it_should_behave_like "all static pages"
 
  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { '私たちについて' }
    let(:page_title) { '私たちについて' }

    it_should_behave_like "all static pages"
 
  end

  describe "contact page" do
    before { visit contact_path }
 
    let(:heading) { '連絡先' }
    let(:page_title) { 'コンタクト' }

    it_should_behave_like "all static pages"
  end

  it "should have a right links on the layout" do
    visit root_path
    click_link "ヘルプ"
    expect(page).to have_title(full_title("ヘルプ"))
    click_link "コンタクト"
    expect(page).to have_title(full_title("コンタクト"))
    click_link "私たちについて"
    expect(page).to have_title(full_title("私たちについて"))
  end

end
 





