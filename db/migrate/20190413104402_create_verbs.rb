class CreateVerbs < ActiveRecord::Migration[5.2]
  def change
    create_table :verbs do |t|
      t.references :topic, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
