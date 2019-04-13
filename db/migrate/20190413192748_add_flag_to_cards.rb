class AddFlagToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :fake, :boolean, default: false
  end
end
