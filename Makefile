NAME ?= elswork/tf-opencv

build:
	docker build --no-cache -t $(NAME):latest --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg VERSION=latest-`cat VERSION` . > ../builds/tf-ocv_`date +"%Y%m%d_%H%M%S"`.txt
tag:
	docker tag $(NAME):latest $(NAME):latest-`cat VERSION`
push:
	docker push $(NAME):latest-`cat VERSION`
	docker push $(NAME):latest	
deploy: build tag push

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
