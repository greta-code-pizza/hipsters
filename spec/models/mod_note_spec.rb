require "rails_helper"

describe ModNote do
  let(:user) { create(:user) }
  let(:moderator) { create(:user, :moderator) }

  it "validates the length of note" do
    mod_note = ModNote.new(user: user,
                           moderator: moderator,
                           note: 'a' * 65_536,
                           markeddown_note: 'a')
    expect(mod_note).not_to be_valid
    expect(mod_note.errors.messages.dig(:note))
      .to eq([I18n.t('activerecord.errors.models.mod_note.attributes.note.too_long')])
  end

  it "validates the length of markeddown_note" do
    mod_note = ModNote.new(user: user,
                           moderator: moderator,
                           note: 'a',
                           markeddown_note: 'a' * 65_536)
    expect(mod_note).not_to be_valid
    expect(mod_note.errors.messages.dig(:markeddown_note))
      .to eq([I18n.t('activerecord.errors.models.mod_note.attributes.markeddown_note.too_long')])
  end

  it "validates the presence of note" do
    mod_note = ModNote.new(user: user,
                           moderator: moderator,
                           note: nil,
                           markeddown_note: 'a')
    expect(mod_note).not_to be_valid
    expect(mod_note.errors.messages.dig(:note))
      .to eq([I18n.t('activerecord.errors.models.mod_note.attributes.note.blank')])
  end

  it "validates the presence of markeddown_note" do
    mod_note = ModNote.new(user: user,
                           moderator: moderator,
                           note: 'a',
                           markeddown_note: nil)
    expect(mod_note).not_to be_valid
    expect(mod_note.errors.messages.dig(:markeddown_note))
      .to eq([I18n.t('activerecord.errors.models.mod_note.attributes.markeddown_note.blank')])
  end
end
