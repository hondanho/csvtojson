#!/bin/bash

# Khởi động MySQL
service mysql start

# Khởi động Apache
apachectl -D FOREGROUND
