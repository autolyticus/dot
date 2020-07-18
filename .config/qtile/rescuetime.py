#! /usr/bin/env python


def getData():
    import requests
    import csv

    from io import StringIO
    from os.path import expanduser

    with open(expanduser('~/.local/.rescuetime')) as f:
        key = f.read().strip()

    csvStr = requests.get(
        f'https://rescuetime.com/anapi/data?key={key}&format=csv', verify=False).content

    csvFile = StringIO(csvStr.decode())
    data = []

    dicts = csv.DictReader(csvFile)
    for row in dicts:
        data.append(row)

    return data


def productivityPulse():
    data = getData()
    numerator = 0
    total = 0
    for row in data:
        numerator += int(row['Time Spent (seconds)']) * \
            (int(row['Productivity']) + 2)
        total += int(row['Time Spent (seconds)'])

    return str(int(numerator / (total * 4) * 100))


def allDistractingTime():
    data = getData()
    import datetime
    import dateutil.relativedelta

    distractingSeconds = 0
    for row in data:
        if int(row['Productivity']) < 0:
            distractingSeconds += int(row['Time Spent (seconds)'])

    dt1 = datetime.datetime.fromtimestamp(distractingSeconds)
    dt2 = datetime.datetime.fromtimestamp(0)
    rd = dateutil.relativedelta.relativedelta(dt1, dt2)

    return f'{rd.hours}h {rd.minutes}m'
