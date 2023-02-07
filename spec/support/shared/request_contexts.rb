RSpec.shared_context "with user logged in" do
  let(:user) { create(:user) }

  before { login_as(user) }
end
