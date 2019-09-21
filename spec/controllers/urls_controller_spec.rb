require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe "GET #show" do
    it "Should redirect to a original link" do
      url = create(:url_created)

      get :show, params: {id: url.code }
      expect(response).to redirect_to url.long_url
    end

    it "Should redirect to root path by invalid code " do
      url = create(:url_created)

      get :show, params: {id: 'adqws' }
      expect(response).to redirect_to root_path
    end
  end
end
