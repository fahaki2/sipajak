#!/usr/bin/sh

nohup java -Dlog4j.configuration=log4j2.xml -jar SSO-Sipajak.jar --spring.config.location=application.yml > console/ssoservice.log 2>&1 &

