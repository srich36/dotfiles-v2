#!/bin/bash
pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
pulseaudio -k
