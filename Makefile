# use the rest as arguments for command
RUN_ARGS :=	$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
# ...and turn them into do-nothing targets
$(eval $(RUN_ARGS):;@:)
run:
	docker-compose exec web sh -c 'python manage.py $(RUN_ARGS)'
build:
    make lock && docker-compose build
up:
        docker-compose up --exit-code-from web --abort-on-container-exit
start:
        docker-compose start
down:
        docker-compose down
restart:
        docker-compose stop
        docker-compose up -d
ps:
        docker-compose ps
shell:
	docker-compose run --rm web python manage.py shell
makemigrations:
	docker-compose run --rm web python manage.py makemigrations
migrate:
	docker-compose run --rm web python manage.py migrate
