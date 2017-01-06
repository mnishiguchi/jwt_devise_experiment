require "test_helper"

describe ReactController do
  it "should get index" do
    get react_index_url
    value(response).must_be :success?
  end

end
