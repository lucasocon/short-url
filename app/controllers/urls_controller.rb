class UrlsController < ApplicationController
  def show
    url = Url.find_by(code: params[:id])

    if url
      url.increment_redirects_amount
      redirect_to url.long_url
    else
      redirect_to root_path, notice: 'Url does not exist.'
    end
  end

  def show_all
    @urls = Url.top_100
  end

  def new
  end

  def create
    @url = Url.find_or_create_by(long_url: params[:long_url])
    @url.save
  end
end