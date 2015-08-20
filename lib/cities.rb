class Cities

  attr_reader(:id, :city_name, :city_stops)

  define_method(:initialize) do |attributes|
    @city_name = attributes.fetch(:city_name)
    @city_stops = attributes.fetch(:city_stops)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM cities;")
    cities = []
    database_results.each do |city|
      cities << Cities.new({city_name: city.fetch('city_name'), city_stops: city.fetch('city_stops'), id: city.fetch('id').to_i})
    end
    cities
  end

  define_method(:save) do
    DB.exec("INSERT INTO cities (city_name, city_stops) VALUES ('#{city_name}', '#{city_stops}')")
  end

  define_method(:==) do |city|
    (self.city_name && self.city_stops && self.id) == (city.city_name && city.stops && city.id)
  end

  define_singleton_method(:find) do |city_name|
    cities_arr = Cities.all
    cities_arr.each do |city|
      if city.city_name == id
        return city
      end
    end
    nil
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM cities *;")
  end

end
