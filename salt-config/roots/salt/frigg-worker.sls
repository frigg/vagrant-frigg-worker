frigg:
  user.present:
    - shell: /bin/bash

/opt/frigg-worker:
  file.directory:
    - makedirs: True
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
    - require:
      - user: frigg
      - file: /opt/frigg-worker
      - pkg: libxml2-dev
      - pkg: libxslt-dev

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

libxml2-dev:
  pkg.installed

libxslt-dev:
  pkg.installed

supervisor:
  pkg.installed

frigg-worker:
  supervisord.running:
    - update: True
    - watch:
      - file: /etc/supervisor/conf.d/frigg-worker.conf
