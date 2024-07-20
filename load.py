"""
Copy configuration files from repository directory to home directory.
"""
from sys import version_info
from pathlib import Path
from shutil import copy, copytree
from blacklist import blacklist

if version_info < (3, 8, 0):
    print(f'Python version {version_info} too old')
    exit(1)

repo = Path(__file__).parent.resolve()
home = Path().home()
ignore = list(map(lambda x : repo / x, blacklist))

for entry in repo.glob('*'):
    if entry in ignore:
        continue

    new_entry = home / entry.relative_to(repo)
    if entry.is_file():
        copy(entry, new_entry)
    else:
        copytree(entry, new_entry, dirs_exist_ok=True)

    print(f'{str(entry):40s} -> {str(new_entry):40s}')

