"""
Copy configuration files from home directory to repo directory.
"""
from sys import version_info
from pathlib import Path
from shutil import copy, copytree
from blacklist import blacklist, check, confirm

check()

repo = Path(__file__).parent.resolve()
home = Path().home()
ignore = list(map(lambda x : repo / x, blacklist))

confirm(home, repo)

for replace_entry in repo.glob('*'):
    if replace_entry in ignore:
        continue

    entry = home / replace_entry.relative_to(repo)
    if entry.exists():

        if replace_entry.is_file():
            copy(entry, replace_entry)
        else:
            copytree(entry, replace_entry, dirs_exist_ok=True)

        print(f'{str(entry):40s} -> {str(replace_entry):40s}')

