Gem::Specification.new do |s|
  s.name        = 'capistrano-apt'
  s.version     = '0.0.3'
  s.date        = '2018-10-17'
  s.summary     = "APT utilities for Capistrano"
  s.description = "APT utilities for Capistrano"
  s.authors     = ["Kevin McCormack"]
  s.email       = 'harlemsquirrel@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.homepage    =
    'https://github.com/HarlemSquirrel/capistrano-apt'
  s.license       = 'MIT'

  s.add_dependency 'capistrano', '~> 3.0'
  s.add_dependency 'sshkit', '~> 1.2'
end
