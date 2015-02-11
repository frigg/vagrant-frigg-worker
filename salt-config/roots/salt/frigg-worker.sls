en_US.UTF-8:
    locale.system

frigg:
  user.present:
    - shell: /bin/bash

/opt/frigg-worker:
  file.directory:
    - makedirs: True
    - user: frigg
    - require:
      - user: frigg

/etc/frigg:
  file.directory:
    - makedirs: True

/etc/frigg/config.yml:
  file.managed:
    - source: salt://files/worker.yaml
    - user: frigg
    - require:
      - user: frigg
      - file: /etc/frigg

/opt/frigg-worker/venv:
  virtualenv.managed:
    - requirements: salt://files/requirements.txt
    - user: frigg
    - cwd: /opt/frigg-worker
    - python: /usr/bin/python3
    - require:
      - user: frigg
      - file: /opt/frigg-worker
      - pkg: frigg-apt-dependencies 
      - pkg: python-virtualenv
      - locale: en_US.UTF-8

/var/log/frigg-worker.log:
  file.managed:
    - user: frigg
    - replace: False
    - contents: -----

/etc/supervisor/conf.d/frigg-worker.conf:
  file.managed:
    - source: salt://files/supervisor-worker.config
    - require:
      - pkg: supervisor
      - file: /var/log/frigg-worker.log

frigg-apt-dependencies:
  pkg:
    - installed
    - names:
      - libxml2-dev
      - libxslt-dev
      - lib32z1-dev
      - libyaml-dev

supervisor:
  pkg.installed

frigg-worker:
  supervisord.running:
    - update: True
    - watch:
      - file: /etc/supervisor/conf.d/frigg-worker.conf
