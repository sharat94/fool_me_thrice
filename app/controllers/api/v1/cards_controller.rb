class Api::V1::CardsController < Api::ApiController

  def index
    cards = Card.where(topic: @current_user.topics)
    selected_cards = cards.ids - (@current_user.cards_read + @current_user.cards.ids)
  	display_cards = cards.select{ |card| selected_cards.ids.include? card.id }
  	render json: display_cards
  end

  def update_user_topic
    topic_ids = params[:topic_ids]
    @current_user.topic_ids = topic_ids
		@current_user.save!
  end

  def make_card
  	topics =  Topic.left_outer_joins(:cards).select("topics.*, COUNT(cards.*) as cards_count").group("topics.id").uniq
  	count = []
  	topics.tap{ |topic| count.push(topic.cards_count) }
  	min_count = count.min
  	min_topic = topics.select{ |topic| topic.cards_count == min_count }.last
  	subjects = Subject.where(topic: min_topic).sample(3)
  	verbs = Verb.where(topic: min_topic).sample(3)
  	victims = Victim.where(topic: min_topic).sample(3)
  	payload = { topic: min_topic, subjects: subjects, verbs: verbs, victims: victims}
  	render json: payload
  end

  def create
  	description = params[:description]
  	topic_id = params[:topic_id]
  	fake = params[:fake]
  	source = params[:source]
  	user_id = @current_user.id
  	Card.create!(description: description, topic_id: topic_id, fake: fake, user_id: user_id, source: source)
  end

end
