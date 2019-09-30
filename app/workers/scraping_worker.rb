class ScrapingWorker
  include Sidekiq::Worker

  def perform(url_created)
    url = Url.find(url_created)
    agent = Mechanize.new
    visit_page = agent.get(url.long_url)

    if visit_page.code == '200'
      url.page_title = visit_page.title
      url.save!
    end
  rescue StandardError
    Rails.logger.warn "Impossible to assign the title to the url (ID: #{url_created})"
    nil
  end
end
