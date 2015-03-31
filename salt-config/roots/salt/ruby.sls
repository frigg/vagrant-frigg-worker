ruby:
  pkg:
    - installed
    - names:
      - ruby
      - ruby-dev

bundler:
  gem.installed:
    - require:
      - pkg: ruby

compass:
  gem.installed:
    - require:
      - pkg: ruby

jekyll:
  gem.installed:
    - require:
      - pkg: ruby
