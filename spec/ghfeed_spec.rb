require 'rubygems'
require 'rspec'
require 'vcr'
require_relative '../lib/github.rb'
require_relative 'support/vcr_setup.rb'

# Remember, # is short for instance method, and . is short for class method

describe GHFeed::RepoInfo do
	describe '.get_repo_data' do
		it "gets back an array of commits from GitHub" do
			VCR.use_cassette('clamstew_matchsetter_repo') do
				expect(GHFeed::RepoInfo.get_repo_data('clamstew', 'matchsetter').class).to eq(Array)
			end
		end
	end
end

describe GHFeed::UserInfo do
	describe '.get_user_data' do
		it "returns the url to the user's corresponding gravatar image" do
			VCR.use_cassette('gravatar') do
				expect(GHFeed::UserInfo.gravatar_url('clamstew')).to eq("https://secure.gravatar.com/avatar/4160d85e44344f10d06edf3f2b9ee97c")
			end
		end
	end
end
