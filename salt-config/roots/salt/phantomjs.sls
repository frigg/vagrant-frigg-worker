phantomjs-deps:
  pkg.installed:
    - pkgs:
      - git
      - g++
      - flex
      - bison
      - gperf
      - ruby
      - perl
      - libsqlite3-dev
      - libfontconfig1-dev
      - libicu-dev
      - libfreetype6
      - libssl-dev
      - libpng-dev
      - libjpeg-dev

phantomjs:
  pkg.installed:
    - require:
      - pkg: phantomjs-deps
