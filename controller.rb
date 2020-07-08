require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
also_reload('./models/*')

# INDEX
get '/students' do
    @students = Student.all()
    erb(:index)
end

# NEW
get '/students/new' do
    erb(:new)
end

# CREATE
post '/students' do
    @student = Student.new(params)
    @student.save()
    redirect '/students'
end