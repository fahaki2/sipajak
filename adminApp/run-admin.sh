#!/usr/bin/sh

nohup java -Dlog4j.configuration=log4j2.xml -jar Admin-Sipajak.jar --spring.config.location=application.yml > console/adminservice.log 2>&1 &

