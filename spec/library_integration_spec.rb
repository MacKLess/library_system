require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('redirecting to admin page', {:type => :feature}) do
  it('allows the user to access the admin page') do
    visit('/')
    click_link('I am an administrator')
    expect(page).to have_content('Access book catalogue')
  end
end

describe('redirect to admin_books page', {:type => :feature}) do
  it('allows the user to access the admin books page') do
    visit('/admin')
    click_link('Access book catalogue')
    expect(page).to have_content('Book Catalogue')
  end
end

describe('redirect to admin_patrons page', {:type => :feature}) do
  it('allows the user to access the admin patrons page') do
    visit('/admin')
    click_link('Access patron catalogue')
    expect(page).to have_content('Patron Catalogue')
  end
end

describe('submit a new book instance with title and author', {:type => :feature}) do
  it('allows the user to create a new book instance with title and author') do
    visit('/admin_books')
    fill_in('new_book_title', :with => "Harry Potter and the Sorcerers Stone")
    fill_in('new_book_author', :with => "J.K. Rowling")
    click_button('Add!')
    expect(page).to have_content("Harry Potter and the Sorcerers Stone")
  end
end
