class Api::V1::TopicsController < Api::ApiController

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
    render json: @topics
  end

  def update_user_topic
    topic_ids = params[:topic_ids]
    @current_user.topic_ids = topic_ids
    render json: @current_user
  end

end
