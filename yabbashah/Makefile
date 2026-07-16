SERVICES = $(shell (find . -maxdepth 2 -name docker-compose.yml -exec dirname {} \;; find ../thebel/portainer/agent -maxdepth 1 -name docker-compose.yml -exec dirname {} \;) | sed 's|^\./||' | sort -u)

up:
	@for d in $(SERVICES); do \
		echo "Starting $$d..."; \
		(cd $$d && docker compose up -d); \
	done

down:
	@for d in $(SERVICES); do \
		echo "Stopping $$d..."; \
		(cd $$d && docker compose down); \
	done
