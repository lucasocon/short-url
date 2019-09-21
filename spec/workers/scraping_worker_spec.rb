require "rails_helper"
require 'sidekiq_helper'

describe ScrapingWorker do
  describe "#perform" do
    it "should be set the page title to url " do
      url = Url.create(long_url: 'https://www.google.com')
      url_created = ScrapingWorker.new.perform(url.id)
      expect(url_created).to eq(true)

      url = Url.find(url.id)
      expect(url.page_title).to eq("Google")
    end

    it "should be not set the page title to url, wrong long_url" do
      url = Url.create(long_url: 'https://www.11111111111111111111.com')
      url_created = ScrapingWorker.new.perform(url.id)
      expect(url_created).to eq(nil)
    end
  end
end