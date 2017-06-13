$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'mail_form/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'mail_form'
  s.version     = MailForm::VERSION
  s.authors     = ['JoseMPena']
  s.email       = ['josmpena91@gmail.com']
  s.homepage    = 'https://github.com/JoseMPena'
  s.summary     = 'A nice rails plugin that mails a form.'
  s.description = 'A nice rails plugin that mails a form.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.3'

  s.add_development_dependency 'sqlite3'
end
