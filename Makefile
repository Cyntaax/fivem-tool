build:
	docker  -d \
		--name=builder:latest \
		-v ./output:/usr/app/src/backend/fivem-tool.exe \
		builder:latest