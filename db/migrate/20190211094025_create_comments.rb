class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :content
      t.integer :claps

      t.timestamps
    end
  end
end
