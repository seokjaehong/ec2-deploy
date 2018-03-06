#!/usr/bin/env bash
<<<<<<< HEAD
export DJANGO_SETTINGS_MODULE=config.settings.production
# Nginx에 존재하는 enable 서버설정링크 삭제
sudo rm -rf /etc/nginx/sites-enabled/*
#프로젝트의 ngninx설정을 복사해서 available폴더로 복사
sudo cp -f /srv/ec2-deploy/.config/nginx-app.conf \
           /etc/nginx/sites-available/nginx-app.conf
#availabe에 설정한 nginx설정을 enable에 링크
sudo ln -sf /etc/nginx/sites-available/nginx-app.conf \
            /etc/nginx/sites-enabled/nginx-app.conf
#uwsgi서비스를 systemd/system에 복사
sudo cp -f /srv/ec2-deploy/.config/uwsgi.service \
           /etc/systemd/system/uwsgi.service
#collectstatic을 위한 과정
cd /srv/ec2-deploy/app
#ubuntu 유저로 collectstatic명령어를 실행(deploy 스크립트가 root권한으로 실행되기 떄문에 강제로 변경)

/bin/bash -c \
'/home/ubuntu/.pyenv/versions/fc-ec2-deploy/bin/python \
/srv/ec2-deploy/app/manage.py collectstatic --noinput' ubuntu
#uwsgi,nginx 재시작
=======
sudo rm -rf /etc/nginx/sites-enabled/*
sudo cp -f /srv/ec2-deploy/.config/nginx-app.conf \
           /etc/nginx/sites-available/nginx-app.conf
sudo ln -sf /etc/nginx/sites-available/nginx-app.conf \
            /etc/nginx/sites-enabled/nginx-app.conf
sudo cp -f /srv/ec2-deploy/.config/uwsgi.service \
           /etc/systemd/system/uwsgi.service
cd /srv/ec2-deploy/app
/bin/bash -c \
'/home/ubuntu/.pyenv/versions/fc-ec2-deploy/bin/python \
/srv/ec2-deploy/app/manage.py collectstatic --noinput' ubuntu
>>>>>>> origin/master
sudo systemctl enable uwsgi
sudo systemctl daemon-reload
sudo systemctl restart uwsgi nginx