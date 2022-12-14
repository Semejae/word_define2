require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word paths') do 

  before :each do
    Word.clear
  end

describe('create a definition for word path',{:type => :feature}) do
  it('creates a definition for word page') do
    word = Word.new('Giant',nil)
    word.save
    visit('/word')
    click_on('Giant')
    fill_in('', :with => 'is a person')
    click_on('Add definition')
    expect(page).to have_content('is a person')
  end
end

describe('update a definition path', {:type => :feature}) do 
  it('updates a definition and returns to page') do
    word = Word.new('Giant',nil)
    word.save
    visit('/word')
    click_on('Giant')
    click_on('is a person')
    fill_in('name', :with => 'is not a person')
    click_on('Update definition')
    expect(page).to have_content('is not a person')
  end
end

describe('delete a definition path', {:type => :feature}) do 
  it('deletes a definition and returns to the words page') do 
    word = Word.new("Giant", nil)
    word.save
    visit('/word') 
    click_on("Giant")
    fill_in('definition_name', :with => 'is a person')
    click_on('Add definition')
    click_on("is a person")
    click_on("Delete definition")
    expect(page).to have_no_content("is a person")
  end
end

end
