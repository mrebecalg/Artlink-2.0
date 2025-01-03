require "test_helper"

class PostulationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postulation = postulations(:one)
  end

  test "should get index" do
    get postulations_url
    assert_response :success
  end

  test "should get new" do
    get new_postulation_url
    assert_response :success
  end

  test "should create postulation" do
    assert_difference("Postulation.count") do
      post postulations_url, params: { postulation: { content: @postulation.content, portfolio: @postulation.portfolio, receiver_id: @postulation.receiver_id, sender_id: @postulation.sender_id, status: @postulation.status, title: @postulation.title } }
    end

    assert_redirected_to postulation_url(Postulation.last)
  end

  test "should show postulation" do
    get postulation_url(@postulation)
    assert_response :success
  end

  test "should get edit" do
    get edit_postulation_url(@postulation)
    assert_response :success
  end

  test "should update postulation" do
    patch postulation_url(@postulation), params: { postulation: { content: @postulation.content, portfolio: @postulation.portfolio, receiver_id: @postulation.receiver_id, sender_id: @postulation.sender_id, status: @postulation.status, title: @postulation.title } }
    assert_redirected_to postulation_url(@postulation)
  end

  test "should destroy postulation" do
    assert_difference("Postulation.count", -1) do
      delete postulation_url(@postulation)
    end

    assert_redirected_to postulations_url
  end
end
