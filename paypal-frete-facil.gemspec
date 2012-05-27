# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "paypal-frete-facil"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Prodis a.k.a. Fernando Hamasaki"]
  s.date = "2012-05-27"
  s.description = "Calculo de frete atraves do PayPal Frete Facil (http://www.paypal-brasil.com.br/fretefacil)."
  s.email = "prodis@gmail.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "README.rdoc",
    "Rakefile",
    "lib/paypal-frete-facil.rb",
    "lib/paypal/fretefacil.rb",
    "lib/paypal/fretefacil/frete.rb",
    "lib/paypal/fretefacil/frete_resultado.rb",
    "lib/paypal/fretefacil/parser.rb",
    "lib/paypal/fretefacil/shipping.rb",
    "lib/paypal/fretefacil/shipping_result.rb",
    "lib/paypal/fretefacil/version.rb",
    "lib/paypal/fretefacil/web_service.rb",
    "paypal-frete-facil.gemspec",
    "spec/paypal/fretefacil/frete_resultado_spec.rb",
    "spec/paypal/fretefacil/frete_spec.rb",
    "spec/paypal/fretefacil/parser_spec.rb",
    "spec/paypal/fretefacil/shipping_result_spec.rb",
    "spec/paypal/fretefacil/shipping_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/fake_request.rb",
    "spec/support/responses/success_response.xml"
  ]
  s.homepage = "http://prodis.blog.br/paypal-frete-facil-gem-para-calculo-de-frete-do-paypal-frete-facil"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "1.8.16"
  s.summary = "Calculo de frete do PayPal Frete Facil."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<log-me>, ["~> 0.0.2"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
    else
      s.add_dependency(%q<log-me>, ["~> 0.0.2"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
    end
  else
    s.add_dependency(%q<log-me>, ["~> 0.0.2"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
  end
end

