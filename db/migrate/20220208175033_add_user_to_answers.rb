class AddUserToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :user, foreign_key: { to_table: :users }
  end
end
