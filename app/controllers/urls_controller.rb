class UrlsController < ApplicationController
  def show
    url = Url.find_by(code: params[:id])

    respond_to do |format|
      if url
        url.increment_redirects_amount
        format.html { redirect_to url.long_url }
      else
        format.html { redirect_to root_path, notice: 'Url does not exist.' }
      end
    end
  end

  def show_all
    @urls = Url.all.limit(100).order(redirects_amount: :desc)
  end

  def new
  end

  def create
    @url = Url.find_or_create_by(long_url: params[:long_url])
    @url.save

    respond_to do |format|
      format.js
    end
  end
end