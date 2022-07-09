# -*- encoding: utf-8 -*-
# stub: ruby-lsp 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-lsp".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shopify".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-06-15"
  s.description = "A simple language server for ruby".freeze
  s.email = ["ruby@shopify.com".freeze]
  s.executables = ["ruby-lsp".freeze]
  s.files = ["exe/ruby-lsp".freeze]
  s.homepage = "https://github.com/Shopify/ruby-lsp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.3".freeze
  s.summary = "A simple language server for ruby".freeze

  s.installed_by_version = "3.3.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<language_server-protocol>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.0"])
    s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<syntax_tree>.freeze, [">= 2.4"])
  else
    s.add_dependency(%q<language_server-protocol>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 1.0"])
    s.add_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
    s.add_dependency(%q<syntax_tree>.freeze, [">= 2.4"])
  end
end
