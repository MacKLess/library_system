require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('redirect to books page', {:type => :feature}) do
  it('allows the user to access the book catalogue') do
    visit('/')
    click_link('/books/<%= book.title %>')
    expect(page).to have_content('Welcome to the Book page')
  end
end

describe('redirect to patrons page', {:type => :feature}) do
  it('allows the user to access the patron catalogue') do
    visit('/')
    click_link('/patrons/<%= patron.name %>')
    expect(page).to have_content('Welcome to the Patron page')
  end
end

describe('redirect to books detail page', {:type => :feature}) do
  it('allows the user to access the detail page of a particular book') do
    visit('/books/:id')
    click_button('Show patrons')
    expect(page).to have_content('Select all patrons who have checked out this book:')
  end
end

describe('redirect to patrons detail page', {:type => :feature}) do
  it('allows the user to access the detail page of a particular patron') do
    visit('/patrons/:id')
    click_link('See books')
    expect(page).to have_content('Select all of the books which have been checked out by this patron:')
  end
end

# describe('redirecting to admin page', {:type => :feature}) do
#   it('allows the user to access the admin page') do
#     visit('/')
#     click_link('I am an administrator')
#     expect(page).to have_content('Access book catalogue')
#   end
# end
#
# describe('redirect to admin_books page', {:type => :feature}) do
#   it('allows the user to access the admin books page') do
#     visit('/admin')
#     click_link('Access book catalogue')
#     expect(page).to have_content('Book Catalogue')
#   end
# end
#
# describe('redirect to admin_patrons page', {:type => :feature}) do
#   it('allows the user to access the admin patrons page') do
#     visit('/admin')
#     click_link('Access patron catalogue')
#     expect(page).to have_content('Patron Catalogue')
#   end
# end

describe('submit a new book instance with title and author', {:type => :feature}) do
  it('allows the user to create a new book instance with title and author') do
    visit('/books')
    fill_in('title', :with => "Harry Potter and the Sorcerers Stone")
    fill_in('author', :with => "J.K. Rowling")
    click_button('Add Book')
    expect(page).to have_content("Harry Potter and the Sorcerers Stone")
  end
end

describe('submit a new patron instance with name', {:type => :feature}) do
  it('allows the user to create a new patron instance with name') do
    visit('/patrons')
    fill_in('name', :with => "Rudolph Valentino")
    click_button('Add!')
    expect(page).to have_content('Rudolph Valentino')
  end
end
