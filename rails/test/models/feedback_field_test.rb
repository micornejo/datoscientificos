require 'test_helper'

class FeedbackFieldTest < ActiveSupport::TestCase
  test "add a retrive fields" do
    count = FeedbackField.fields.count
    FeedbackField.new(id: 'one', type: 'radio', title: 'one title', description: 'one description')
    assert_equal count + 1, FeedbackField.fields.count
    FeedbackField.new(id: 'two', type: 'text', title: 'two title', description: 'two description')
    assert_equal count + 2, FeedbackField.fields.count
    assert_equal FeedbackField['one'].title, 'one title'
    assert_equal FeedbackField['two'].description, 'two description'
  end
end
