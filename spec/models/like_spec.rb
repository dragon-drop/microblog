require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to have_db_column(:likeable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:likeable_type).of_type(:string) }

  it { is_expected.to belong_to(:likeable) }

  describe "validation" do
    it "validates presence of user_id" do
      like = build(:like, user_id: nil)
      expect(like.valid?).to be false
    end
  end
end
