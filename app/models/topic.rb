class Topic < ApplicationRecord
    has_many :verbs
    has_many :victims
    has_many :subjects
    has_many :cards
    has_many :user_topics
    has_many :users, :through => :user_topics

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            card = find_by_id(row["id"]) || new
            card.attributes = row.to_hash.slice('name')
            card.save!
        end
    end
end
