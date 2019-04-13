class Topic < ApplicationRecord
    has_many :verbs
    has_many :victims
    has_many :subjects
    has_many :cards
    has_many :user_topics
    has_many :users, :through => :user_topics
end
