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
    - name: python-pip
    - require:
      - pkg: python2

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
    - require:
      - pkg: python3

python-virtualenv:
  pkg.latest:
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
    - require:
      - pip: pip2

