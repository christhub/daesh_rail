require('sinatra')
require('sinatra/reloader')
require('./lib/trains')
require('./lib/stops')
require('./lib/cities')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "train_system"})

get('/') do
  erb(:index)
end

get('/cities/') do
  @cities = Cities.all
  erb(:cities)
end

get('/trains/') do
  @trains = Train.all
  erb(:trains)
end

get('/employee/') do
  erb(:employee_form)
end

post('/employee/new/') do
  city_name = params.fetch('city_name', nil)
  train_name = params.fetch('train_name', nil)
  origin_city = params.fetch('origin_city', nil)
  departure_time = params.fetch('departure_time', nil)
  final_destination_city = params.fetch('final_destination_city', nil)
  arrival_time = params.fetch('arrival_time', nil)
  stops = params.fetch('stops', nil).join(" ")
  new_train = Train.new({:id => nil, :train_name => train_name, :origin_city => origin_city, :departure_time => departure_time, :final_destination_city => final_destination_city, :arrival_time => arrival_time, :stops => stops})
  new_train.save
  erb(:employee_form_success)
end
