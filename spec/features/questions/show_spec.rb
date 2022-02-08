require 'rails_helper'

feature 'User can view the question and answers', %q{
  In order to get find a question and answers
  I'd like to be able to a question
} do 

  given(:question) { create(:question) }
  given(:answer) { create(:answer, question: question) }

  scenario 'get a question with answers' do
    visit question_path(question.id)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    expect(page).to have_content answer.body
  end
end
