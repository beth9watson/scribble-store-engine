$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scribble_store/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scribble_store"
  s.version     = ScribbleStore::VERSION
  s.authors     = ["Bethany Watson"]
  s.email       = ["bwatson2@binghamton.edu"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ScribbleStore."
  s.description = "TODO: Description of ScribbleStore."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
