require_relative 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Logging.logger = Rails.logger
Sidekiq::Testing.fake!

RSpec.configure do |config|
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end

Dir[Rails.root.join('app/workers/**/*_worker.rb')].each { |f| require f }