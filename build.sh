#!/bin/bash

export JAVA_HOME=$JDK17

mvn clean package -U -Dmaven.test.skip=true