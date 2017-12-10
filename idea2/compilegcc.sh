#!/bin/bash

cython3 boacompiler.py --embed -o boacompiler.c
gcc boacompiler.c -I./venv/include -I./venv/include/python3.5m/ -L./venv/lib  -o cboacompiler -lpython3.5m

