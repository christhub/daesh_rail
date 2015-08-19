class Train
  attr_reader(:train_name, :id, :origin_city, :departure_time, :final_destination_city, :arrival_time, :stops)

  define_method(:initialize) do |attributes|
    @train_name = attributes.fetch(:train_name)
    @id = attributes.fetch(:id)
    @origin_city = attributes.fetch(:origin_city)
    @departure_time = attributes.fetch(:departure_time)
    @final_destination_city = attributes.fetch(:final_destination_city)
    @arrival_time = attributes.fetch(:arrival_time)
    @stops = attributes.fetch(:stops)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM trains;")
    trains = []
    database_results.each() do |train|
      train_name = train.fetch('train_name')
      id = train.fetch('id')
      origin_city = train.fetch('origin_city')
      departure_time = train.fetch('departure_time')
      final_destination_city = train.fetch('final_destination_city')
      arrival_time = train.fetch('arrival_time')
      trains << Train.new({:id => id, :train_name => train_name, :origin_city => origin_city, :departure_time => departure_time, :final_destination_city => final_destination_city, :arrival_time => arrival_time, :stops => stops})
    end
    trains
  end

  define_method(:save) do
    DB.exec("INSERT INTO trains (train_name, origin_city, departure_time, final_destination_city, arrival_time, stops) VALUES ('#{train_name}', '#{origin_city}', '#{departure_time}', '#{final_destination_city}', '#{arrival_time}', '#{stops}' )")
  end

  define_method(:==) do |other_train|
    (self.train_name && self.stops) == (other_train.train_name && other_train.stops)
  end

  define_singleton_method(:find) do |identifier|
    found_train = nil
    trains = Train.all
    trains.each() do |train|
      if train.train_name == identifier
        found_train = train
      end
    end
    found_train
  end
end
