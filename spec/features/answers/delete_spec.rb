require 'rails_helper'

feature 'User can delete his answer', %q{
  In order to get remove an answer
  I'd like to be able to delete my answer
} do 

  given(:author) { create(:user) }
  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answer) { create(:answer, question: question, user: author) }

  scenario 'user can delete his answer' do
    sign_in(author)
    visit question_path(answer.question)
    expect(page).to have_content "MyText"
    click_on "Delete answer"

    expect(page).to have_content 'answer deleted'
    expect(page).to_not have_content "MyText"
  end

  scenario 'a member want to delete others answers' do
    sign_in(user)
    visit question_path(answer.question)

    expect(page).to_not have_link 'Delete answer'
  end

  scenario 'Unauthenticated user trying to delete answer' do
    visit question_path(answer.question)
    expect(page).to_not have_link 'Delete answer'
    click_on 'Sign in to write an answer'

    expect(page).to have_content "Log in"
  end

end
  