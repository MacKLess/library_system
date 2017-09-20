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
  erb(:admin)
end

get('/admin_patrons') do
  @patrons = Patron.all
  erb(:admin_patrons)
end

get('/admin_books') do
  @books = Book.all
  erb(:admin_books)
end
