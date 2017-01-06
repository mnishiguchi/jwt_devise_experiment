require "test_helper"

describe AuthenticationController do
  it "should get authenticate" do
    get authentication_authenticate_url
    value(response).must_be :success?
  end

end
