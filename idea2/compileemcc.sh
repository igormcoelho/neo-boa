#!/bin/bash

cython3 boacompiler.py --embed -o boacompiler.c
emcc boacompiler.c -I./venv/include -I./venv/include/python3.5m/  -o boacompiler.bc
emcc boacompiler.bc python35.bc -o jsboacompiler.js

