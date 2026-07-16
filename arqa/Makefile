up:
	for d in */; do \
		if [ -f $$d/docker-compose.yml ]; then \
			(cd $$d && docker compose up -d); \
		fi; \
	done

down:
	for d in */; do \
		if [ -f $$d/docker-compose.yml ]; then \
			(cd $$d && docker compose down); \
		fi; \
	done
