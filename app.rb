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
  @stops = Stop.all
  erb(:employee_form)
end

post('/employee/new_train/') do
  train_name = params.fetch('train_name')
  origin_city = params.fetch('origin_city')
  departure_time = params.fetch('departure_time')
  final_destination_city = params.fetch('final_destination_city')
  arrival_time = params.fetch('arrival_time', nil)
  stops = params.fetch('stops').join(" ")
  new_train = Train.new({:id => nil, :train_name => train_name, :origin_city => origin_city, :departure_time => departure_time, :final_destination_city => final_destination_city, :arrival_time => arrival_time, :stops => stops})
  new_train.save
  erb(:employee_form_success)
end

post('/employee/new_city/') do
  city_name = params.fetch('city_name', nil)
  city_stops = params.fetch('city_stops', nil).join('')
  new_city = Cities.new({:id => nil, :city_name => city_name, :city_stops => city_stops})
  new_city.save
  erb(:employee_form_success)
end

post('/employee/clear_trains/') do
  Train.clear()
  erb(:employee_form_success)
end

post('/employee/clear_cities/') do
  Cities.clear()
  erb(:employee_form_success)
end

post('/employee/new_stop/') do
  stop_name = params.fetch('stop_name')
  city_name = params.fetch('city_name')
  new_train = Stop.new({:id => nil, :city_name => city_name, :stop_name => stop_name})
  new_train.save
  erb(:employee_form_success)
end

post('/employee/clear_stops/') do
  Stop.clear()
  erb(:employee_form_success)
end

get('/employee/modify_train/:id/') do
  @stops = Stop.all
  @id = params.fetch('id').to_i
  erb(:modify_train)
end

patch('/employee/modify_train') do
  id = params.fetch('id').to_i
  train_name = params.fetch('train_name')
  origin_city = params.fetch('origin_city')
  departure_time = params.fetch('departure_time')
  final_destination_city = params.fetch('final_destination_city')
  arrival_time = params.fetch('arrival_time')
  stops = params.fetch('stops').join(" ")
  train_obj = Train.find_by_id(id)
  train_obj.update({:train_name => train_name, :origin_city => origin_city, :departure_time => departure_time, :final_destination_city => final_destination_city, :arrival_time => arrival_time, :stops => stops, :id => id})
  redirect('/trains/')
end

post('/employee/delete_train') do

end
