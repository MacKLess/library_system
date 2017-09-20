require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/book')
require('./lib/patron')
require('./lib/checkout')
require('pg')
require('pry')

DB = PG.connect({:dbname => "library_test"})

get('/') do
  erb(:index)
end

get('/admin') do
  @books = Book.all
  @patrons = Patron.all
  erb(:admin)
end
