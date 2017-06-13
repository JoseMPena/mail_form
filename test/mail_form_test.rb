require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase
  test 'sample mail has name and email as attributes' do
    sample = SampleMail.new
    sample.name = 'User'
    sample.email = 'user@example.com'
    assert_equal 'User', sample.name
    assert_equal 'user@example.com', sample.email
  end
  
  test 'sample email can clear attributes using clear_prefix' do
    # setup
    sample = SampleMail.new
    sample.name = 'User'
    sample.email = 'user@example.com'

    # actual expectation
    sample.clear_name
    sample.clear_email
    assert_nil sample.name
    assert_nil sample.email
  end
end
