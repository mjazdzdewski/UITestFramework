#!/usr/bin/env bash

if [ "$TRAVIS_EVENT_TYPE" != "cron" ]; then
    mvn clean install -PFT
fi