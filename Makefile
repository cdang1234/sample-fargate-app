.PHONY: run
run:
		docker build -t sample-fargate-app .
		docker run -it -p 3000:3000 sample-fargate-app

.PHONY: deploy
deploy:
		aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 421239949123.dkr.ecr.us-west-1.amazonaws.com/sample-fargate-app
		docker build -t sample-fargate-app .
		docker tag sample-fargate-app:latest 421239949123.dkr.ecr.us-west-1.amazonaws.com/sample-fargate-app:latest
		docker push 421239949123.dkr.ecr.us-west-1.amazonaws.com/sample-fargate-app:latest
		aws ecs update-service --cluster slide-production --service sample --force-new-deployment
