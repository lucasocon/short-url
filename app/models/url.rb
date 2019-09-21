class Url < ApplicationRecord
  #public_uid configuration
  generate_public_uid column: :code, generator: PublicUid::Generators::HexStringSecureRandom.new(4)

  #validates
  validates :long_url, presence: true, url: true

  #callbacks
  after_create :set_short_url
  after_create :set_title

  #methods
  def increment_redirects_amount
    self.redirects_amount += 1
    self.save!
  end

  private

  def set_short_url
    self.short_url = Rails.application.credentials.root_url + "/" + self.code
    self.save!
  end

  def set_title
    ScrapingWorker.perform_async(self.id)
  end
end
