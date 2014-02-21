require 'slim'
require 'sinatra'

get '/' do
	slim :feed
end
