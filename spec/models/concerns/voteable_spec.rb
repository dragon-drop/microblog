require "rails_helper"
require "support/shoulda_matchers"

shared_examples "voteable" do
  it { is_expected.to have_many(:likes) }
end
