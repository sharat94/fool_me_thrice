require 'test_helper'

class VerbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verb = verbs(:one)
  end

  test "should get index" do
    get verbs_url
    assert_response :success
  end

  test "should get new" do
    get new_verb_url
    assert_response :success
  end

  test "should create verb" do
    assert_difference('Verb.count') do
      post verbs_url, params: { verb: { name: @verb.name, topic_id: @verb.topic_id } }
    end

    assert_redirected_to verb_url(Verb.last)
  end

  test "should show verb" do
    get verb_url(@verb)
    assert_response :success
  end

  test "should get edit" do
    get edit_verb_url(@verb)
    assert_response :success
  end

  test "should update verb" do
    patch verb_url(@verb), params: { verb: { name: @verb.name, topic_id: @verb.topic_id } }
    assert_redirected_to verb_url(@verb)
  end

  test "should destroy verb" do
    assert_difference('Verb.count', -1) do
      delete verb_url(@verb)
    end

    assert_redirected_to verbs_url
  end
end
