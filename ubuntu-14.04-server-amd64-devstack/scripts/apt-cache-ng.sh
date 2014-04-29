#!/bin/bash

echo 'Acquire::http { Proxy "http://10.0.2.2:3142"; };' | tee /etc/apt/apt.conf
