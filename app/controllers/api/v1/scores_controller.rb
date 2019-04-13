class Api::V1::ScoresController < Api::ApiController

  def update_score
    card_id = params[:card_id]
    answer = params[:answer]
    card = Card.find card_id
    if answer == true
      card.upvote += 1
      card.save!
      update_user_score(card)
    else
      card.downvote += 1
      card.save!
      update_user_score(card)
    end
    render json: @current_user
  end


  private

  def update_user_score(card)
    if !card.fake
      @current_user.correct_answers += 1
      @current_user.save!
    else
      @current_user.wrong_answers += 1
      @current_user.save!
    end
    @current_user.reload
  end
end
