#!/bin/bash

PROCESS_DATETIME=$(date "+%m_%d_%y_%H_%M_%S")
LOG_DIR=$HOME/opt/jupyter/logs
LOGFILE=$LOG_DIR/jupter_$PROCESS_DATETIME.log
ANACONDA=$HOME/anaconda3/bin

cd $HOME

find $LOG_DIR/ -type f -name '*.log' -mtime +30 -exec rm {} \;

# source .bashrc
source $ANACONDA/activate fastai > $LOGFILE 2>&1
$ANACONDA/jupyter notebook >> $LOGFILE 2>&1 &
