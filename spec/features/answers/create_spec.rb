require 'rails_helper'

feature 'User can write answers for a question', %q{
  In order to write answer to a question
  As an authenticated user
  I'd like to be able to write an answer
} do 

  given(:question) { create(:question) }
  given(:answer) { create(:answer, question: question) }

  scenario 'write an answer' do
    visit question_path(question)

    fill_in 'answer[body]', with: 'text text text'
    click_on 'Write answer'
    expect(page).to have_content 'text text text'
  end
  
end
