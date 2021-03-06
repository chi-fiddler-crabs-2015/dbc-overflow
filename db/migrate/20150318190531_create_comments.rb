class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references   :response, polymorphic: true
      t.belongs_to   :user
      t.text         :content

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
