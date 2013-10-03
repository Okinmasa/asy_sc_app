require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
  	it "should include page ritle" do
  	  expect(full_title("foo")).to match(/foo/)
  	end

  	it "should include base_title" do
  	  expect(full_title("foo")).to match(/^統制ツール/)
  	end

  	it "should not includes a ber for the home page" do
  	  expect(full_title("")).not_to match(/\|/)
  	end
  end
end