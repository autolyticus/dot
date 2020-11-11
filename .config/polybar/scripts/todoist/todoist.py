#!/usr/bin/env python3

import sh
from sh import td
td('s')
csv = td('--csv', '--header', 'l',  f='overdue | @habit | today | @next | (p1 & !#TICKLER) | p2')
from csv import DictReader
from io import StringIO
file = StringIO(csv.strip())
for task in DictReader(file):
    print(task['Content'])
