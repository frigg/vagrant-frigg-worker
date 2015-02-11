oracle-java8-installer:
  pkgrepo.managed:
    - ppa: webupd8team/java
  pkg.installed:
    - require:
      - pkgrepo: oracle-java8-installer
  debconf.set:
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
    - require_in:
      - pkg: oracle-java8-installer

maven:
  pkg.installed
