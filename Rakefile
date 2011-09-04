# encoding: utf-8
require 'rubygems'
require 'rake'
require './lib/paypal/fretefacil/version'

require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "paypal-frete-facil"
  gem.homepage = "http://prodis.blog.br/2011/09/04/gem-para-calculo-de-frete-do-paypal-frete-facil"
  gem.license = "MIT"
  gem.summary = %Q{Cálculo de frete do PayPal Frete Fácil.}
  gem.description = %Q{Cálculo de frete através do PayPal Frete Fácil (http://www.paypal-brasil.com.br/fretefacil).}
  gem.email = "prodis@gmail.com"
  gem.authors = ["Prodis a.k.a. Fernando Hamasaki"]
  gem.version = PayPal::FreteFacil::Version::VERSION
  gem.required_ruby_version = ">= 1.8.7"
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "paypal-frete-facil #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
