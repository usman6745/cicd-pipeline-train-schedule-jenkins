#!/bin/bash
lsof -i :3000 -t | xargs kill
