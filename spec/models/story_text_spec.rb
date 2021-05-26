require 'rails_helper'

RSpec.describe StoryText, type: :model do
  it "has a limit on the story cache field" do
    s = StoryText.new
    s.body = "Z" * 16_777_218

    s.valid?
    expect(s.errors[:body]).to eq([I18n.t('activerecord.errors.models.story_text.attributes.body.too_long')])
  end
end
