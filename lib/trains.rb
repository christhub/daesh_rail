class Train
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    database_results = DB.exec("SELECT * FROM trains;")
    trains = []
    database_results.each() do |train|
      name = train.fetch('name')
      id = train.fetch('id')
        trains << Train.new(:name => name, :id => id.to_i)
    end
    trains
  end

  define_method(:save) do
    DB.exec("INSERT INTO trains (name, id) VALUES ('#{name}', #{id})")
  end

  define_method(:==) do |other_train|
    (self.name && self.id) == (other_train.name && other_train.id)
  end
end
