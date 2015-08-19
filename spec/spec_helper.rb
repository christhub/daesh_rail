require('cities')
require('trains')
require('rspec')
require('PG')

DB = PG.connect(:dbname => 'train_system_test')
