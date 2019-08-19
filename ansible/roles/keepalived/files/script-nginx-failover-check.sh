#!/bin/sh
nc -z localhost 18181 && nc -z localhost 18182
exit $?
