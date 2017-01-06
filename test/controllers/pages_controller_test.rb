require "test_helper"

describe PagesController do
  it "should get home" do
    get pages_home_url
    value(response).must_be :success?
  end

end
