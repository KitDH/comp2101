#!/bin/bash
# using rsync as a way to backup my personal bin directory to a backup directory

rsync -arv ~/bin/ ~/backups
