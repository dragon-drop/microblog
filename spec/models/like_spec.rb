require "rails_helper"

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }

  it "has a valid factory" do
    expect(create(:like)).to be_valid
  end

  describe "association" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end
