#!/bin/bash

qrencode -t UTF8 "WIFI:S:$1;T:WPA2;P:$2;;" | lolcat
