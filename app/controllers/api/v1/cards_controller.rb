class Api::V1::CardsController < Api::ApiController

  def index
    cards = Card.where(topic: @current_user.topics)
    selected_cards = cards&.ids - (@current_user.cards_read + @current_user&.cards&.ids)
		display_cards = cards.select{ |card| selected_cards.include? card.id } if selected_cards.present?
  	render json: display_cards || []
  end

  def update_user_topic
    topic_ids = params[:topic_ids]
    @current_user.topic_ids = topic_ids
		@current_user.save!
  end

  def get_keywords
  	topics =  Topic.left_outer_joins(:cards).select("topics.*, COUNT(cards.*) as cards_count").group("topics.id").uniq
  	count = []
		if topics.present?
  	  topics.tap{ |topic| count.push(topic.cards.count) }
  	  min_count = count.min
  	  min_topic = topics.select{ |topic| topic.cards.count == min_count }.last
  	  subjects = Subject.where(topic: min_topic).sample(3)
  	  verbs = Verb.where(topic: min_topic).sample(2)
  	  victims = Victim.where(topic: min_topic).sample(3)
		end
		min_topic ||= subjects ||= verbs ||= victims ||= []
		payload = { topic: min_topic || [], subjects: subjects || [], verbs: verbs || [], victims: victims || []}
  	render json: payload
  end

  def create
  	description = params[:description]
  	topic_id = params[:topic_id]
  	fake = params[:fake]
  	source = params[:source]
  	user_id = @current_user.id
  	card = Card.create!(description: description, topic_id: topic_id, fake: fake, user_id: user_id, source: source)
		card.reload
		render json: card
  end

end
