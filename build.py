import json
import time

data = {}
data['metadata'] = {}
data['metadata']['generated'] = int(time.time())
data['metadata']['valid'] = data['metadata']['generated'] + 7200
data['roas'] = []

irrFile = open('irr.db', 'r')
irrData = irrFile.readlines()
prefix = ""
for line in irrData:
    split = line.split()
    if 2 > len(split):
        continue;
    if split[1].find("::") != -1:
        prefix = split[1];
    if split[1].find(".") != -1:
        prefix = split[1];
    if split[1].find("AS") != -1:
        data['roas'].append({
            'prefix': prefix,
            'asn': split[1],
            'ta': "IRRitation",
            'maxLength': "24" if prefix.find(".") != -1 else "48"
        })

data['metadata']['counts'] = len(data['roas'])
with open('irr.json', 'w') as outfile:
    json.dump(data, outfile)
