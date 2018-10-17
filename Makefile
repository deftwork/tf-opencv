NAME ?= elswork/tf-opencv

build:
	docker build --no-cache -t $(NAME):amd64 --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg VERSION=amd64-`cat VERSION` . > ../builds/tf-ocv_`date +"%Y%m%d_%H%M%S"`.txt
tag:
	docker tag $(NAME):amd64 $(NAME):amd64-`cat VERSION`
push:
	docker push $(NAME):amd64-`cat VERSION`
	docker push $(NAME):amd64	
deploy: build tag push
manifest:
	docker manifest create $(NAME):`cat VERSION` $(NAME):amd64-`cat VERSION` \
	$(NAME):arm32v7-`cat VERSION`
	docker manifest push --purge $(NAME):`cat VERSION`
	docker manifest create $(NAME):latest $(NAME):amd64 $(NAME):arm32v7
	docker manifest push --purge $(NAME):latest
start:
	docker run -it $(NAME):amd64

build-arm:
	docker build --no-cache -t $(NAME):arm32v7 --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg VERSION=arm32v7-`cat VERSION` . > ../builds/tf-ocv-arm_`date +"%Y%m%d_%H%M%S"`.txt
tag-arm:
	docker tag $(NAME):arm32v7 $(NAME):arm32v7-`cat VERSION`
push-arm:
	docker push $(NAME):arm32v7-`cat VERSION`
	docker push $(NAME):arm32v7	
deploy-arm: build-arm tag-arm push-arm
start-arm:
	docker run -it $(NAME):arm32v7
