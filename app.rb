require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/book')
require('./lib/patron')
require('./lib/checkout')
require('pg')
require('pry')

DB = PG.connect({:dbname => "library"})

get('/') do
  erb(:index)
end

get('/admin') do
  erb(:admin)
end

get('/admin_books') do
  @books = Book.all
  erb(:admin_books)
end

post('/admin_books') do
  title = params.fetch('new_book_title')
  author = params.fetch('new_book_author')
  book = Book.new({:title => title, :author => author, :id => nil})
  book.save
  @books = Book.all
  erb(:admin_books)
end

get('/admin_patrons') do
  @patrons = Patron.all
  erb(:admin_patrons)
end

post('/admin_patrons') do
  name = params.fetch('new_patron_name')
  patron = Patron.new({:name => name, :id => nil})
  patron.save
  @patrons = Patron.all
  erb(:admin_patrons)
end
