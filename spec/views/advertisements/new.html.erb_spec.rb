require 'rails_helper'

RSpec.describe "advertisements/new", type: :view do
  before(:each) do
    assign(:advertisement, Advertisement.new(
      title: "MyString",
      content: "MyString",
      tag: "MyString"
    ))
  end

  it "renders new advertisement form" do
    render

    assert_select "form[action=?][method=?]", advertisements_path, "post" do

      assert_select "input[name=?]", "advertisement[title]"

      assert_select "input[name=?]", "advertisement[content]"

      assert_select "input[name=?]", "advertisement[tag]"
    end
  end
end
