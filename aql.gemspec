# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = 'aql'
  s.version  = '0.0.3'

  s.authors  = ['Markus Schirp']
  s.email    = 'mbj@seonic.net'
  s.summary  = 'The ArangoDB AQL AST. Intended for query generation.'
  s.homepage = 'http://github.com/mbj/aql'
  s.license  = 'MIT'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_paths    = %w(lib)
  s.extra_rdoc_files = %w(README.md)

  s.add_dependency('backports',     [ '~> 3.0', '>= 3.0.3' ])
  s.add_dependency('adamantium',    '~> 0.0.7')
  s.add_dependency('equalizer',     '~> 0.0.5')
  s.add_dependency('abstract_type', '~> 0.0.5')
  s.add_dependency('concord',       '~> 0.1.0')
end
