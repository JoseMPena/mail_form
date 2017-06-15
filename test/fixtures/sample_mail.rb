class SampleMail < MailForm::Base
  attributes :name, :email

  def headers
    { to: 'recipient@example.com', from: email }
  end
end