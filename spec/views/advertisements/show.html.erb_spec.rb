require 'rails_helper'

RSpec.describe "advertisements/show", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      title: "Title",
      content: "Content",
      tag: "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Tag/)
  end
end
