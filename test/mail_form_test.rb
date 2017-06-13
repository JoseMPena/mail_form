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
  
  test 'sample mail can ask whether an attribute is present' do
    sample = SampleMail.new
    assert !sample.name?
    
    sample.name = 'User'
    assert sample.name?
    
    sample.email = ''
    assert !sample.email?
  end
  
  test 'sample mail can reset attribute to its default value' do
    sample = SampleMail.new
    sample.name = 'User'
    sample.email = 'user@example.com'
    
    sample.reset_name_to_default
    assert_equal 'default', sample.name
    sample.reset_email_to_default
    assert_equal 'default', sample.email
  end
end
