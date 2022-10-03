require 'uri'
require 'net/http'
class Api::CharactersController < ApplicationController
  def index
    query = params[:query].downcase.gsub(/ /, '%')
    @characters = Character.where('lower(name) LIKE ?', "%#{query}%").order_by_name_similarity(query).limit(10)

    expires_in 10.minutes
  end

  def show
    @character = Character.find(params[:id])
    auth = {
      publicKey: ENV.fetch('MARVEL_PUBLIC_KEY'),
      privateKey: ENV.fetch('MARVEL_PRIVATE_KEY'),
      ts: Time.now.to_i
    }
    auth_hash = Digest::MD5.hexdigest("#{auth[:ts]}#{auth[:privateKey]}#{auth[:publicKey]}")
    uri = URI("https://gateway.marvel.com:443/v1/public/characters/#{@character.external_id}")
    params = { 
      apikey: auth[:publicKey],
      ts: auth[:ts],
      hash: auth_hash
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    @externalData = res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body).dig('data', 'results') : ''

    expires_in 1.day
  end
end
