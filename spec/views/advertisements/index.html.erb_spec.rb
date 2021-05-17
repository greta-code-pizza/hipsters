require 'rails_helper'

RSpec.describe "advertisements/index", type: :view do
  before(:each) do
    assign(:advertisements, [
      Advertisement.create!(
        title: "Title",
        content: "Content",
        tag: "Tag"
      ),
      Advertisement.create!(
        title: "Title",
        content: "Content",
        tag: "Tag"
      )
    ])
  end

  it "renders a list of advertisements" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Content".to_s, count: 2
    assert_select "tr>td", text: "Tag".to_s, count: 2
  end
end
