import hashlib
import requests
import re
import shutil

def is_commit(x):
    return re.match("^[a-f0-9]{40}$", commit)

commit = input("Enter SHA1 github commit (40 symbols)... ")

if not is_commit(commit):
    print("this does not look like commit...")
    exit(1)

url = "https://github.com/VeriBlock/alt-integration-cpp/archive/{}.tar.gz".format(commit)

h = hashlib.sha512()

with requests.get(url, stream=True) as r:
    r.raise_for_status()
    print("downloading...")
    for chunk in r.iter_content(chunk_size=100000):
        if chunk:
            print("+{} bytes...".format(len(chunk)))
            h.update(chunk)

print("SHA512 of commit {}".format(commit))
print(h.hexdigest())
