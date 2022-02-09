require 'rails_helper'

feature 'User can write answers for a question', %q{
  In order to write answer to a question
  As an authenticated user
  I'd like to be able to write an answer
} do 

  given(:user) { create(:user) }
  given(:question) { create(:question, user: user) }

  describe 'Authenticated user can write question' do
    background do
      sign_in(user)
      visit question_path(question.id)
    end
  
    scenario 'write an answer' do

      fill_in 'answer[body]', with: 'text text text'
      click_on 'Write answer'
      expect(page).to have_content 'text text text'
    end
  end

  scenario 'Unauthenticated user tries to write an answer' do
    visit question_path(question.id)
    click_on 'Sign in to write an answer'
  
    expect(page).to have_content 'Log in'
  end
end
