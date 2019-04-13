class AddCardsreadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cards_read, :integer, array: true, default: []
  end
end
