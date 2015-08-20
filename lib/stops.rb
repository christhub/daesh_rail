class Stop

  attr_reader(:id, :train_name, :city_name, :stop_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @train_name = attributes.fetch(:train_name)
    @city_name = attributes.fetch(:city_name)
    @stop_name = attributes.fetch(:stop_name)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM stop;")
    stops = []
    database_results.each do |stop|
      train_name = stop.fetch('train_name')
      id = stop.fetch('id').to_i
      city_name = stop.fetch('city_name')
      stop_name = stop.fetch('stop_name')
      stops << Stop.new({id: id, train_name: train_name, city_name: city_name, stop_name: stop_name})
    end
    stops
  end

  define_method(:save) do
    DB.exec("INSERT INTO stop (train_name, city_name, stop_name) VALUES ('#{train_name}', '#{city_name}', '#{stop_name}');")
  end

  define_method(:==) do |stop|
    (self.train_id && self.id && self.city_id ) == (stop.id && stop.train_id && stop.city_id)
  end

  define_singleton_method(:find) do |id|
    stop_arr = Stop.all
    stop_arr.each do |stop|
      if stop.id == id
        return stop
      end
    end
    nil
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM stop *;")
  end

end
