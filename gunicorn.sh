#!/bin/bash


sudo cp -rf jenkins2-deployment-gunicorn.socket  /etc/systemd/system/
sudo cp -rf jenkins2-deployment-gunicorn.service  /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl start jenkins2-deployment-gunicorn.socket
sudo systemctl enable jenkins2-deployment-gunicorn.socket

sudo systemctl start jenkins2-deployment-gunicorn.service
sudo systemctl enable jenkins2-deployment-gunicorn.service

sudo systemctl daemon-reload
sudo systemctl restart jenkins2-deployment-gunicorn.socket
sudo systemctl restart jenkins2-deployment-gunicorn.service
sudo systemctl status jenkins2-deployment-gunicorn.service