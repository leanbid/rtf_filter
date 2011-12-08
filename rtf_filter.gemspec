# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rtf_filter/version"

Gem::Specification.new do |s|
  s.name        = "rtf_filter"
  s.version     = RtfFilter::VERSION
  s.authors     = ["PS Computer Services LTD"]
  s.email       = ["it@pscomputer.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Converts Rich Text Format (RTF) word processing files to plain text}
  s.description = %q{Converts Rich Text Format (RTF) word processing files to plain text}

  s.rubyforge_project = "rtf_filter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
