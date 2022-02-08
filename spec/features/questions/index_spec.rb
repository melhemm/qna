require 'rails_helper'

feature 'User can get all questions', %q{
  In order to get find a question
  I'd like to be able to get all questions
} do 

  given(:question) { create(:question) }

  scenario 'get all questions' do
    visit root_path

    expect(page).to have_content 'Questions'
    expect(page).to have_content question.title
    expect(page).to have_content question.body
  end
end
  