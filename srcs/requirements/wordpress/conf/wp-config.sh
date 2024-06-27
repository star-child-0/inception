#!bin/bash

envsubst < wp-config.php > wp-config.tmp
mv wp-config.tmp wp-config.php
