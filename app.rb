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
  @books = Book.all
  @patrons = Patron.all
  erb(:index)
end

get('/books') do
  @books = Book.all
  erb(:books)
end

get('/patrons') do
  @patrons = Patron.all
  erb(:patrons)
end

post('/books') do
  title = params.fetch("title")
  author = params.fetch("author")
  book = Book.new({:title => title, :author => author, :id => nil})
  book.save
  @books = Book.all
  erb(:books)
end

post('/patrons') do
  name = params.fetch("name")
  patron = Patron.new({:name => name, :id => nil})
  patron.save
  @patrons = Patron.all
  erb(:patrons)
end

get('/books/:id') do
  @book = Book.find_id(params.fetch('id').to_i)
  # @patrons = Patron.all
  erb(:book_detail)
end

get('/patrons/:id') do
  @patron = Patron.find(params.fetch('id').to_i)
  @books = Book.all
  erb(:patron_detail)
end

patch('/books/:id') do
  book_id = params.fetch('id').to_i
  @book = Book.find(book_id)
  patron_ids = params.fetch('patron_ids')
  @book.update({:patron_ids => patron_ids})
  @patrons = Patron.all
  erb(:book_detail)
end

patch('/patrons/:id') do
  patron_id = params.fetch('id').to_i
  @patron = Patron.find(patron_id)
  book_ids = params.fetch('book_ids')
  @patron.update({:book_ids => book_ids})
  @books = Book.all
  erb(:patron_details)
end

# get('/admin') do
#   erb(:admin)
# end

# get('/admin_books') do
#   @books = Book.all
#   erb(:admin_books)
# end
#
# post('/admin_books') do
#   title = params.fetch('new_book_title')
#   author = params.fetch('new_book_author')
#   book = Book.new({:title => title, :author => author, :id => nil})
#   book.save
#   @books = Book.all
#   erb(:admin_books)
# end
#
# get('/admin_patrons') do
#   @patrons = Patron.all
#   erb(:admin_patrons)
# end
#
# post('/admin_patrons') do
#   name = params.fetch('new_patron_name')
#   patron = Patron.new({:name => name, :id => nil})
#   patron.save
#   @patrons = Patron.all
#   erb(:admin_patrons)
# end

# get('/') do
#   @user = params[:user]
#   if @user == "patron"
#     @patron = Patron.find_by(params['patron_name'])
#     @user = patron
#     return erb(:patron)
#   else @user = "admin"
#   erb(:index)
# end
