class Url < ApplicationRecord
  #public_uid configuration
  generate_public_uid column: :code, generator: PublicUid::Generators::HexStringSecureRandom.new(4)

  # Validations
  validates :long_url, presence: true, url: true

  # Callbacks
  after_create :set_short_url
  after_create :set_title

  def increment_redirects_amount
    self.redirects_amount += 1
    save!
  end

  def self.top_100
    all.limit(100).order(redirects_amount: :desc)
  end

  private

  def set_short_url
    self.short_url = "#{Rails.application.credentials.root_url}/#{code}"
    save!
  end

  def set_title
    ScrapingWorker.perform_async(id)
  end
end
