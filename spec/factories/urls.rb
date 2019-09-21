FactoryBot.define do
  factory :url do
    factory :url_created do
      long_url { "https://www.google.com" }
      redirects_amount { 3 }
      page_title { "Google" }
    end

    factory :url_new_1 do
      long_url { "https://github.com/thoughtbot/factory_bot" }
    end
  end
end
