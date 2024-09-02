@echo off

docker-compose -f qa/docker-compose.yml up %*
pause
