python2:
  pkg:
    - latest
    - names:
      - python-dev
      - python
      - python-pip

python3:
  pkg:
    - latest
    - names:
      - python3-dev
      - python3
      - python3-pip

pip2:
  pip:
    - installed
    - name: pip
    - upgrade: True
    - require:
      - pkg: python2

/usr/local/bin/pip3:
  file.symlink:
    - target: /usr/bin/pip3
    - require:
      - pkg: python3

pip3:
  pip:
    - installed
    - name: pip
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pkg: python3
      - file: /usr/local/bin/pip3

virtualenv:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pkg: python2 
      - pkg: python3
      - pip: pip3

flake8:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip2
    - require:
      - pip: pip2

tox:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pip: pip3

isort:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip2
    - require:
      - pip: pip2

coverage:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pip: pip3
