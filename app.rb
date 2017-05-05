class CatTime < Sinatra::Base

  set :port, 8080  
  
  get '/' do
    @cat_pic = get_a_cat()
    erb :index
  end

  def get_a_cat
    client = CatAPI.new
    cat_pic = client.get_images(results_per_page: 1).first

    return cat_pic.url
  end
end
