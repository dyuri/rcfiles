#!/bin/bash

ffmpeg -i $1 -filter:v "setpts=0.1*PTS" timelapse.mp4
ffmpeg -i timelapse.mp4 -filter:v "minterpolate='mi_mode=mci:mc_mode=aobmc:vsbmc=1:fps=120'" minterpolated.mp4
