class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all

    # return a JSON response with an array of all the bakery data
    bakeries.to_json
  end

  # get 'bakeries/:id' do
  #   bakery = Bakery.find(params[:id])

  #   bakery.to_json(include: :baked_goods)
  # end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  # get '/games/:id' do
  #   # look up the game in the database using its ID
  #   game = Game.find(params[:id])
  #   # send a JSON-formatted response of the game data
  #   game.to_json(only: [:id, :title, :genre, :price, :platform], include: {
  #     reviews: { only: [:comment, :score], include: {
  #       user: { only: [:name] }
  #     } }
  #   })
  # end
end
