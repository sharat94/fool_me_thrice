class Card < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      card = find_by_id(row["id"]) || new
      card.attributes = row.to_hash.slice('user_id', 'description', 'topic_id', 'source', 'fake
')
      card.attributes['fake'] = card.attributes['fake'].casecmp('true').zero?
      card.save!
    end
  end
end