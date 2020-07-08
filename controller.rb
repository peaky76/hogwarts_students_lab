require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

# INDEX
get '/students' do
    @students = Student.all()
    erb(:index)
end

# NEW
get '/students/new' do
    @houses = House.all()
    erb(:new)
end

# CREATE
post '/students' do
    @student = Student.new(params)
    @student.save()
    redirect '/students'
end