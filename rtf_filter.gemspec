# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rtf_filter/version"

Gem::Specification.new do |s|
  s.name        = "rtf_filter"
  s.version     = RtfFilter::VERSION
  s.authors     = ["PS Computer Services LTD"]
  s.email       = ["it@pscomputer.co.uk"]
  s.homepage    = "https://github.com/PS-Computer-Services-Ltd/rtf_filter"
  s.summary     = %q{Converts Rich Text Format (RTF) word processing files to plain text}
  s.description = %q{Converts Rich Text Format (RTF) word processing files to plain text. Uses the rtf-filter C++ executable}
  s.license = "CDDL"

  s.rubyforge_project = "rtf_filter"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["CDDL-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
