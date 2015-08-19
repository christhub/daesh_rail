class Stop

  attr_reader(:id, :train_id, :city_id, :time)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @train_id = attributes.fetch(:train_id)
    @city_id= attributes.fetch(:city_id)
    @time = attributes.fetch(:time)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM stops;")
    stops = []
    database_results.each do |stop|
      id = stop.fetch('id').to_i
      train_id = stop.fetch('train_id').to_i
      city_id = stop.fetch('city_id').to_i
      time = stop.fetch('time')
      stops << Stop.new({id: id, train_id: train_id, city_id: city_id, time: time})
    end
    stops
  end

  define_method(:save) do
    DB.exec("INSERT INTO stops (id, train_id, city_id, time) VALUES (#{id}, #{train_id}, #{city_id}, '#{time}');")
  end

  define_method(:==) do |stop|
    (self.train_id && self.id && self.city_id && self.time ) == (stop.id && stop.train_id && stop.city_id && stop.time)
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

end
