#!/bin/bash

PLUGIN_NAME="afk-detector"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
