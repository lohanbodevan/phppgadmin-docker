POSTGRES_CONTAINER='postgres'

install:
	docker build -t phppgadmin:0.4 .

run:
	docker run -it -d --name phppgadmin -p 8889:80 --link ${POSTGRES_CONTAINER}:localhost phppgadmin:0.4
