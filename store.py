"""
Copy configuration files from home directory to repo directory.
"""
from sys import version_info
from pathlib import Path
from shutil import copy, copytree
from blacklist import blacklist

if version_info < (3, 8, 0):
    print(f'Python version {version_info} too old')
    exit(1)

repo = Path(__file__).parent.resolve()
home = Path().home() / 'test'
ignore = list(map(lambda x : repo / x, blacklist))

for replace_entry in repo.glob('*'):
    if replace_entry in ignore:
        continue

    entry = home / replace_entry.relative_to(repo)
    if replace_entry.is_file():
        copy(entry, replace_entry)
    else:
        copytree(entry, replace_entry, dirs_exist_ok=True)

    print(f'{str(entry):40s} -> {str(replace_entry):40s}')

