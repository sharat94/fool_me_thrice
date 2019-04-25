class Api::V1::DashboardController < Api::ApiController

  def stats
    top_cards = Card.all.order('cards.upvotes DESC').limit(3)
    top_performers = find_top_performers
    render json: { top_cards: top_cards, top_performers: top_performers}
  end

  private

  def find_top_performers
    query = 'SELECT users.email, SUM(distinct(cards.upvotes)) from users INNER JOIN cards on users.id = cards.user_id GROUP BY users.email LIMIT 5'
    result = ActiveRecord::Base.connection.execute query
    top_performers = []
    result.each do |res|
      top_performers.push(res)
    end
    top_performers
  end
end