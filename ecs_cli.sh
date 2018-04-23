ecs-cli configure --cluster hello-ecs-cli --region ap-northeast-2 \
  --default-launch-type EC2 --config-name hello-ecs-cli

ecs-cli configure profile --access-key ${AWS_ACCESS_KEY_ID} \
  --secret-key ${AWS_SECRET_ACCESS_KEY} --profile-name  hello-ecs-cli

ecs-cli up --keypair voyager.woo \
  --security-group sg-5f7ab935 --cluster hello-ecs-cli \
  --vpc vpc-b40c30dd --subnets subnet-5331741e,subnet-3f5a5656 \
  --capability-iam --size 2 --instance-type t2.medium
# security group은 이름이 아닌 id로 넣어야한다! 이름을 넣으면 클러스터는 생기는데 인스턴스가 안생김...


# test compose container up
ecs-cli compose --file hello-ecs.yml up --create-log-groups --cluster hello-ecs-cli
# test compose scale up
ecs-cli compose --file hello-ecs.yml scale 2 --cluster hello-ecs-cli
# shutdown compose container
ecs-cli compose --file hello-ecs.yml down --cluster hello-ecs-cli

# 서비스 생성
ecs-cli compose --file hello-ecs.yml service create --cluster hello-ecs-cli \
  --deployment-max-percent 200 \
  --deployment-min-healthy-percent 50 \
  --target-group-arn "arn:aws:elasticloadbalancing:ap-northeast-2:957582603404:targetgroup/hello-ecs-cli-service/13e879e4c11b7f11" \
  --health-check-grace-period 30 \
  --container-name hello-ecs-app \
  --container-port 9460 \
  --create-log-groups 

# 서비스 초기화
ecs-cli compose --file hello-ecs.yml service up --cluster hello-ecs-cli

ecs-cli compose --file hello-ecs.yml service scale 2 --cluster hello-ecs-cli 

ecs-cli compose --file hello-ecs.yml service up --cluster hello-ecs-cli --force-deployment