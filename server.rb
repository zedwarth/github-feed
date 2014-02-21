require 'sinatra'

get '/feed/:username/:reponame' do
	erb :feed
end
