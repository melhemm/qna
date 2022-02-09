require 'rails_helper'

feature 'User can delete his question', %q{
  In order to get remove a question
  I'd like to be able to delete my questions
} do 

  given(:author) { create(:user) }
  given(:auth_user) { create(:user) }
  given(:question) { create(:question, user: author) }

  scenario 'delete a question' do
    sign_in(author)
    visit question_path(question)
    click_on 'Delete question'

    expect(page).to have_content 'Questions'
  end

  scenario 'a member want to delete others question' do
    sign_in(auth_user)
    visit question_path(question)

    expect(page).to_not have_link 'Delete Question'
  end
end
  