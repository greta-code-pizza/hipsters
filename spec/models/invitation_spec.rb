require 'rails_helper'

describe Invitation do
  it "has a valid factory" do
    invitation = build(:invitation)
    expect(invitation).to be_valid
  end

  it "has a limit on the email field" do
    invitation = build(:invitation, email: 'a' * 256 + '@b.b')
    invitation.valid?
    expect(invitation.errors[:email]).to eq([I18n.t('activerecord.errors.models.invitation.attributes.email.too_long')])
  end

  it "creates a code before validation" do
    invitation = build(:invitation)
    invitation.code = 'my code'
    invitation.valid?
    expect(invitation.code).to_not eq('my_code')
  end

  it "has a limit on the memo field" do
    invitation = build(:invitation, memo: "a" * 256)
    invitation.valid?
    expect(invitation.errors[:memo]).to eq([I18n.t('activerecord.errors.models.invitation.attributes.memo.too_long')])
  end
end
