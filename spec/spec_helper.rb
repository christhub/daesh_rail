require('cities')
require('trains')
require('rspec')
require('PG')

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
  end
end
