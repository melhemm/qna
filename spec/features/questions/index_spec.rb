require 'rails_helper'

feature 'User can get all questions', %q{
  In order to get find a question
  I'd like to be able to get all questions
} do 

  scenario 'get all questions' do
    visit root_path

    expect(page).to have_content 'Questions'
  end
end
  