require 'unirest'
require 'pry'

module GHFeed
	class RepoInfo
		def self.get_repo_data(username, repo)
			url = "https://api.github.com/repos/#{username}/#{repo}/commits"
			response = Unirest.get url, auth:{ :user=>ENV["USERNAME"], :password=>ENV["PASSWORD"] }
			response.body
		end
	end
	class UserInfo
		def self.gravatar_url(username)
			url = "https://api.github.com/users/#{username}"
			response = Unirest.get url, auth:{ :user=>ENV["USERNAME"], :password=>ENV["PASSWORD"] }
			
			id = response.body["gravatar_id"]
			"https://secure.gravatar.com/avatar/#{id}"
		end
	end
end
