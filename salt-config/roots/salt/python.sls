python2:
  pkg:
    - latest
    - names:
      - python-dev
      - python

python3:
  pkg:
    - latest
    - names:
      - python3-dev
      - python3

pip:
  pkg:
    - latest
    - names: 
      - python-pip
      - python3-pip
    - require:
      - pkg: python2
      - pkg: python3

pip2:
  pip:
    - installed
    - name: pip
    - upgrade: True
    - require:
      - pkg: pip

pip3:
  pip:
    - installed
    - name: pip
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pkg: python3

virtualenv:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pkg: python2 
      - pkg: python3

flake8:
  pip:
    - installed
    - upgrade: True
    - require:
      - pip: pip2

tox:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pip: pip2

isort:
  pip:
    - installed
    - upgrade: True
    - require:
      - pip: pip2

coverage:
  pip:
    - installed
    - upgrade: True
    - bin_env: /usr/local/bin/pip3
    - require:
      - pip: pip2

