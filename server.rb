require 'sinatra'

require_relative 'lib/github'
get '/' do
	"Hey, this is a web app"
end

get '/test' do
		"#{GHFeed::RepoInfo.get_repo_data("clamstew", "matchsetter")}"
end

get '/feed/:username/:reponame' do
	@commits = GHFeed::RepoInfo.get_repo_data(params[:username].to_s, params[:reponame].to_s)
	@user_info = GHFeed::UserInfo.gravatar_url(params[:username].to_s)
	erb :feed
end


