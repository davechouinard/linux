#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This program will format the downloaded weather text for i3blocks
# Created in 2017 by David Chouinard

import re
import subprocess

STRING = subprocess.Popen("wget -q -O- http://www.accuweather.com/en/us/austin-tx/78701/weather-forecast/351193 | grep  'acm_RecentLocationsCarousel\.push'| head -1", shell=True, stdout=subprocess.PIPE).stdout.readline()

temp = re.search('(temp:)(\'\d+\')', STRING)
text = re.search('(text:)(".*")', STRING)
temp = temp.group(2)
text = text.group(2)
temp = temp.strip("'")
text = text.strip('"')
print('%s° %s' % (temp, text))
