# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name                  = 'releasethekraken'
  s.version               = 0.1
  s.date                  = '2021-08-15'
  s.required_ruby_version = '>= 2.6'
  s.homepage              = ''
  s.author                = ''
  s.email                 = ''
  s.summary               = ''
  s.post_install_message  = ''
  s.license               = 'MIT'
  s.files                 = `git ls-files`.split("\n")
  s.require_paths         = %w(lib middlewares)
  s.description           = ''
end
