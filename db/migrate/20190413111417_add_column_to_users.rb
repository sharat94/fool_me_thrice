class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :correct_answers, :integer, default: 0
    add_column :users, :wrong_answers, :integer, default: 0
    add_column :users, :badges, :string, array: true, default: []
  end
end
