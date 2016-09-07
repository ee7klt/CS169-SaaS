# http://github.com/saasbook/cookie-demo

enable :sessions
set :session_secret, '!#^Dxweq'

get '/' do
  session['count'] ||= 0
  session['count'] += 1
  erb session['count'].to_s
end
