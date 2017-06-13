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
end
