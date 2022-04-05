#!/usr/bin/sh

nohup java -Dlog4j.configuration=log4j2.xml -jar Portal-Sipajak.jar --spring.config.location=application.yml > console/portalservice.log 2>&1 &

