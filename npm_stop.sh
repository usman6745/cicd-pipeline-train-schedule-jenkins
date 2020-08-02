#!/bin/bash
lsof -i :3000 -t | xargs kill >> /dev/null 2>&1
