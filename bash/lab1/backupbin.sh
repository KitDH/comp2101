#!/bin/bash
# use rsync to backup the personal bin directoru to a personal backups directory

rsync -arv ~/bin/ ~/backups
