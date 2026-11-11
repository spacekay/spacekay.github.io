# coding: utf-8

Gem::Specification.new do |spec|
  spec.name                    = "freelancer-theme-jekyll"
  spec.version                 = "1.0.1"
  spec.authors                 = ["Start Bootstrap"]

  spec.summary                 = %q{Freelancer is a one page Bootstrap portfolio theme for freelancers.}
  spec.homepage                = "https://github.com/jeromelachaud/freelancer-theme"
  spec.licenses                = ["MIT"]

  spec.metadata["plugin_type"] = "theme"

  spec.files                   = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_(includes|layouts|posts)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end

  spec.add_runtime_dependency "jekyll", "~> 4.0"
  spec.add_runtime_dependency "webrick", "~> 1.7.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "html-proofer", "~> 3.15"
end
