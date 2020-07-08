require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
also_reload('./models/*')