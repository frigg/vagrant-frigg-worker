postgresql:
  pkg.installed

postgresql-server-dev-all:
  pkg.installed

postgres-user-frigg:
  postgres_user.present:
    - name: frigg
    - createdb: True

pg_hba.conf:
  file.managed:
    - name: /etc/postgresql/9.3/main/pg_hba.conf
    - source: salt://files/postgresql/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 644
    - require:
      - pkg: postgresql

redis-server:
  pkg.installed

mongodb:
  pkg.installed

memcached:
  pkg.installed
