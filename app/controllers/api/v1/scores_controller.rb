class Api::V1::ScoresController < Api::ApiController

  def update_score
    card_id = params[:card_id]
    answer = params[:answer]
    card = Card.find card_id
    if answer == true
      card.upvotes += 1
      card.save!
      if !card.fake
        winner = true
        @current_user.correct_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      else
        winner = false
        @current_user.wrong_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      end
      @current_user.reload
    else
      card.downvotes += 1
      card.save!
      if card.fake
        winner = true
        @current_user.correct_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      else
        winner = false
        @current_user.wrong_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      end
      @current_user.reload
    end
    payload = { winner: winner, user: card&.user&.email }
    render json: payload
  end

  private

end
