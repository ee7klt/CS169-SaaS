#!/usr/bin/env ruby

require 'sinatra'

get '/' do
    "Hello World!"
end


set :foo, 'bar'

get '/foo' do
  "foo is set to " + settings.foo
end
