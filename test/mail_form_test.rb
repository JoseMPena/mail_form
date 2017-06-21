require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase

  setup do
    ActionMailer::Base.deliveries.clear
  end

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

  test 'delivers an email with attributes' do
    sample = SampleMail.new
    # Simulate data from the form
    sample.email = 'user@example.com'
    sample.deliver

    assert_equal 1, ActionMailer::Base.deliveries.size
    mail = ActionMailer::Base.deliveries.last

    assert_equal ['user@example.com'], mail.from
    assert_match 'Email: user@example.com', mail.body.encoded
  end
  
  test 'Validates absence of nickname' do
    sample = SampleMail.new nickname: 'Spam'
    assert !sample.valid?
    assert_equal ['is invalid'], sample.errors[:nickname]
  end
  
  test 'provides before and after deliver hooks' do
    sample = SampleMail.new(email: 'user@example.com')
    sample.deliver
    assert_equal [:before, :after], sample.evaluated_callbacks
  end
end
