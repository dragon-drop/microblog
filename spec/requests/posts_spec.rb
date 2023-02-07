require "rails_helper"
require "support/shared/request_specs"

RSpec.describe "Posts requests" do
  describe "GET /" do
    let(:req) { get root_url }

    it_behaves_like "an authenticated route"
  end
end
