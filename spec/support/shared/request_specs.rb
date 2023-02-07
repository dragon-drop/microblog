require "support/shared/request_contexts"

RSpec.shared_examples "an authenticated route" do
  before { logout }

  context "without a user" do
    it "redirects to the sign in page" do
      req
      expect(response).to redirect_to(new_user_session_url).or have_http_status(:unauthorized)
    end
  end

  context "with a user logged in" do
    include_context "with user logged in"
    include_examples "a successful response"
  end
end

RSpec.shared_examples "a successful response" do
  it "responds successfully" do
    req
    expect(response).to be_successful
  end
end
