class Api::CharactersController < ApplicationController
  def index
    query = params[:query].downcase.gsub(/ /, '%')
    @characters = Character.where('lower(name) LIKE ?', "%#{query}%").order_by_name_similarity(query).limit(10)

    expires_in 10.minutes
  end

  def show
    @character = Character.find(params[:id])
  end
end
