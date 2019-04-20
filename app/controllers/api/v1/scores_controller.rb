class Api::V1::ScoresController < Api::ApiController

  def update_score
    card_id = params[:card_id]
    answer = params[:answer]
    card = Card.find card_id
    .update( )
    if answer == true
      card.upvotes += 1
      card.save!
      if !card.fake
        @current_user.correct_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      else
        @current_user.wrong_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      end
      @current_user.reload
    else
      card.downvotes += 1
      card.save!
      if card.fake
        @current_user.correct_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      else
        @current_user.wrong_answers += 1
        @current_user.cards_read.push(card.id)
        @current_user.save!
      end
      @current_user.reload
    end
    render json: @current_user
  end

end
