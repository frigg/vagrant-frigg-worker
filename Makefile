CONFIG_FILE = salt-config/roots/salt/files/worker.yaml

test:
	@echo "No tests"

up: $(CONFIG_FILE)
	vagrant up --provision
	touch up

down:
	rm -f up
	vagrant destroy

$(CONFIG_FILE):
	@echo "Redis-host: ";\
	 read redis_host;\
	 echo "Redis-port: ";\
	 read redis_port;\
	 echo "Redis-password: ";\
	 read redis_pw;\
	 echo "Redis-db: ";\
	 read redis_db;\
	 echo "hq-domain: ";\
	 read domain;\
	 echo "hq-token: ";\
	 read token;\
	 echo "Sentry DSN: ";\
	 read sentry_dsn;\
	 echo "HQ_REPORT_URL: $$domain/api/workers/report/" > $(CONFIG_FILE);\
	 echo "TOKEN: $$token"                             >> $(CONFIG_FILE);\
	 echo "REDIS:"                                     >> $(CONFIG_FILE);\
	 echo "  host: $$redis_host"                       >> $(CONFIG_FILE);\
	 echo "  port: $$redis_port"                       >> $(CONFIG_FILE);\
	 echo "  password: $$redis_pw"                     >> $(CONFIG_FILE);\
	 echo "  db: $$redis_db"                           >> $(CONFIG_FILE);\
	 echo "SENTRY_DSN: $$sentry_dsn"                   >> $(CONFIG_FILE)

setup: $(CONFIG_FILE)
	vagrant up

.PHONY: setup
