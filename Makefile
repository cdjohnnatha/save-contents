DCMP = docker-compose
APP = save_contents_api
DCMP_EXEC_APP = ${DCMP} exec ${APP}
DCMP_RUN_APP = ${DCMP} run ${APP}

production:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rake secret
	bundle exec rails s -p 3000 -b '0.0.0.0' -e production

up:
	${DCMP} up

down:
	${DCMP} down

bash:
	${DCMP_EXEC_APP} bash

console:
	${DCMP_EXEC_APP} rails c

restart-app:
	${DCMP} restart ${APP}

build:
	${DCMP} build --no-cache

rebuild:
	make down
	${DCMP} build --no-cache

docker-createdb:
	${DCMP_RUN_APP} make createdb

createdb:
	bundle exec rails db:drop
	bundle exec rails db:create RAILS_ENV=production
	bundle exec rails db:migrate
	bundle exec rails db:seed
	bundle exec rails db:test:prepare