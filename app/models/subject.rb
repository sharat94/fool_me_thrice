class Subject < ApplicationRecord
  belongs_to :topic

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      card = find_by_id(row["id"]) || new
      card.attributes = row.to_hash.slice('topic_id', 'name')
      card.save!
    end
  end
end
