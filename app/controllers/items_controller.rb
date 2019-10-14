class ItemsController < ApplicationController
  def index
    @items = []
    @genre_id = params[:genre_id] || '110105'

    results = RakutenWebService::Ichiba::Item.ranking(
      genreId: @genre_id
    )
    results.each do |result|
      item = Item.new(read(result))
      @items << item
    end
  end

  private

  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    img_url = result['mediumImageUrls'][0]

    {
      code: code,
      name: name,
      url: url,
      img_url: img_url
    }
  end
end
