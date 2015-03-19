class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references    :tally, polymorphic: true
      t.belongs_to    :user
      t.integer       :value

      t.timestamps
    end
    add_index :votes, :user_id
  end
end
