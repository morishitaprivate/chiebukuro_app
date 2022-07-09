require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_question_answers_url
    assert_response :success
  end

  test "should get create" do
    get answers_create_url
    assert_response :success
  end

end
