require 'bundler'
require './lib/quiz_analyzer'
Bundler.require

class Quiz < Sinatra::Application

  get '/brba-quiz' do

    erb :quiz_form
  end

  post '/results' do
    @params = params

    @analyzer = ::Analyzer.new(@params)
    @character = @analyzer.character
    
    erb :results
  end
end