require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'url is valid' do
    url = Url.new(long_url: 'https://www.google.com')
    expect(url).to be_valid
  end

  it 'url is not valid, long_url is not a url' do
    url = Url.new(long_url: 'google')
    expect(url).to_not be_valid
  end

  it 'url is not valid, long_url is nil' do
    url = Url.new
    expect(url).to_not be_valid
  end

  it 'should be create a new url record' do
    url = create(:url_new_1)

    expect(url.code).to_not be_nil
    expect(url.long_url).to eq('https://github.com/thoughtbot/factory_bot')
    expect(url.short_url).to eq("http://localhost:3000/#{url.code}")
    expect(url.redirects_amount).to eq(0)
  end

  it 'should be increment the number of redirections to the url' do
    url = create(:url_created)

    url.increment_redirects_amount

    expect(url.redirects_amount).to eq(4)
  end
end
