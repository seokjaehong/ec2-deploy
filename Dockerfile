# docker built -t ec2-deploy -f Dockerfile .

FROM        ec2-deploy.base

COPY        . /srv/project