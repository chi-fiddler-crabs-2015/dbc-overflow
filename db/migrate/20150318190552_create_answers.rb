class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to    :user
      t.belongs_to    :question
      t.text          :content


      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end
end
