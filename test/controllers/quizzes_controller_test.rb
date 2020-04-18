require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get questions" do
    get quizzes_questions_url
    assert_response :success
  end

end
