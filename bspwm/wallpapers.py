import os
from datetime import datetime
import time

# Assign time to currenttime
currenttime = datetime.now().time()

# DATETIME USES 24 HOUR TIME
if currenttime.hour >= 21 or currenttime.hour < 7:
	os.system('feh --bg-fill $HOME/Pictures/.wallpapers/bigsur_night.jpg')
else:
	os.system('feh --bg-fill $HOME/Pictures/.wallpapers/bigsur_day.jpg')
