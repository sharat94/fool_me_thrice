# frozen_string_literal: true

class Api::AuthenticationController < ApplicationController
  protect_from_forgery with: :null_session
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      topics = User.find_by(email: params[:email])&.topics || []
      render json: { auth_token: command.result, topics: topics }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
 end
