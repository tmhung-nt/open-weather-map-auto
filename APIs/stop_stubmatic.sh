#!/bin/bash
ps -aux | grep stubmatic | awk '{print $2}' | xargs kill -9