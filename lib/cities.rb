class Cities

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM cities;")
    cities = []
    database_results.each do |city|
      cities << Cities.new({name: city.fetch('name'), id: city.fetch('id')})
    end
    cities
  end

  define_method(:save) do
    DB.exec("INSERT INTO cities (name, id) VALUES ('#{name}', '#{id}')")
  end

end
