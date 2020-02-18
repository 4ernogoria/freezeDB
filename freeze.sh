#!/bin/bash
    echo
    {
    echo "
#    select '-- Flushing all the operations' ;
    FLUSH TABLES WITH READ LOCK  ;
#    select '-- Forcing logs to get flushed' ;
    FLUSH LOGS ;
#    select '-- Check current status...' ;
    SHOW MASTER STATUS ;
#    select '-- ! sync' ;
    system sync ;
#    select '-- ! sleep 1' ;
    system sleep 60 ;
#    select '-- Send a message to syslog' ;
    system storpool volume mariadb snapshot testsnap2;
#    select '-- Unlock tables' ;
    UNLOCK TABLES ;
    "
    } 2>&1 | mysql --unbuffered -vvv 2>&1
