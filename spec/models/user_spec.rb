require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "沖", email: "oki@email.com",
           password: "foobar", password_confirmation: "foobar") }

  subject {  @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name=" " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name="a"*51 }
  	it { should_not be_valid }
  end


  describe "when email format is invalid" do
  	it "should be invalid" do
  	  addresses = %w[foo@ccc,com foo.com foo@kkk. foodd@aa+dd.com]
  	  addresses.each do |invalid_address|
  	  	@user.email = invalid_address
  	  	expect(@user).not_to be_valid
  	  end
  	end
  end

  describe "when email format is valid" do
  	it "should be valid" do
  	  addresses = %w[foo@ccc.com foo.dd@mm.com fooHAM@kkk.co.jp
  	                 foo-+dd@dd.com]
  	  addresses.each do |invalid_address|
  	  	@user.email = invalid_address
  	  	expect(@user).to be_valid
  	  end
  	end
  end

  describe "when email address is alreasy taken" do
  	before do
  	  user_with_duplicated_emmail = @user.dup
  	  user_with_duplicated_emmail.email = @user.email.upcase
  	  user_with_duplicated_emmail.save
  	end

   	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before { @user = User.new(name: "oki", email: "a@a.com", password: " ",
  	                          password_confirmation: " ") }
  	it { should_not be_valid }
  end

  describe "when password confirmation is not match" do
  	before { @user.password_confirmation = "missmatch" }

  	it { should_not be_valid }
  end

  describe "when password is too short" do
  	before { @user.password = @user.password_confirmation = "a"*5 }

  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "when invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
     end
  end
end