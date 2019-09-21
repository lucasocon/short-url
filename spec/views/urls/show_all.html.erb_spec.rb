require 'rails_helper'

RSpec.describe "urls/show_all", type: :view do
  before(:each) do
    assign(:urls, [
      create(:url_created, code: 'asbd')
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Google", :count => 1
    assert_select "tr>td", :text => "http://localhost:3000/asbd", :count => 1
  end
end
