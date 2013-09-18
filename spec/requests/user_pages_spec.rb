require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe 'ユーザー登録' do
  	before { visit signup_path}
  	it { should have_content('ユーザー登録')}
  	it { should have_title(full_title('ユーザー登録'))}
  end
end