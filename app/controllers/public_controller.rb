class PublicController < ApplicationController
  def home
    render json: { message: "API works" }
  end
end
