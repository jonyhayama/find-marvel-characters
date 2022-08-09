class Api::CharactersController < ApplicationController
  def index
    query = params[:query].downcase
    @characters = Character.where('lower(name) LIKE ?', "%#{query}%").order_by_name_similarity(query).limit(10)

    expires_in 10.minutes
  end
end
