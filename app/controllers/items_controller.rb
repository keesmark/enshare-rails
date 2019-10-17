class ItemsController < ApplicationController
  def index
    @items = []
    @genre_id = params[:genre_id] || '110105'

    results = RakutenWebService::Ichiba::Item.ranking(
      genreId: @genre_id
    )
    results.each do |result|
      item = Item.find_or_initialize_by(read(result))
      @items << item
    end
    @ranking_counts = Want.count
  end
end
