class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.references :topic, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.string :source

      t.timestamps
    end
  end
end
