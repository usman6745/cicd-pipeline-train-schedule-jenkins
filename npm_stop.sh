#!/bin/bash
#lsof -i :3000 -t | xargs kill >> /dev/null 2>&1
ps -aux | grep ./bin/www | grep -v grep | xargs kill > /dev/null 2>&1
