# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'paypal/fretefacil/version'

Gem::Specification.new do |gem|
  gem.name        = "paypal-frete-facil"
  gem.version     = PayPal::FreteFacil::VERSION
  gem.authors     = ["Prodis a.k.a. Fernando Hamasaki"]
  gem.email       = ["prodis@gmail.com"]
  gem.summary     = "Calculo de frete do PayPal Frete Facil."
  gem.description = "Calculo de frete atraves do PayPal Frete Facil (http://www.paypal-brasil.com.br/fretefacil)."
  gem.homepage    = "http://prodis.blog.br/paypal-frete-facil-gem-para-calculo-de-frete-do-paypal-frete-facil"
  gem.licenses    = ["MIT"]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.platform              = Gem::Platform::RUBY
  gem.required_ruby_version = Gem::Requirement.new(">= 1.8.7")

  gem.add_dependency "log-me",   "~> 0.0.4"
  gem.add_dependency "nokogiri", "~> 1.5"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec",   "~> 2.11"
  gem.add_development_dependency "webmock", "~> 1.8"
end
