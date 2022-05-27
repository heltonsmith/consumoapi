class PostController < ApplicationController
  def index
    response = RestClient::Request.new(
      :method => :get,
      :url => "https://newsapi.org/v2/everything?q=chile&from=2022-05-27&sortBy=popularity&language=es&apiKey=838753bb2a8741ea93eb75265ad270d8"
    ).execute 

    @resultado = JSON.parse(response.to_str)
    @pager = Kaminari.paginate_array(@resultado["articles"]).page(params[:page]).per(4)
  end
end
