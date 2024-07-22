"""
Copy configuration files from repository directory to home directory.
"""
from pathlib import Path
from shutil import copy, copytree
from blacklist import blacklist, check, confirm

check()

repo = Path(__file__).parent.resolve()
home = Path().home()
ignore = list(map(lambda x : repo / x, blacklist))

confirm(repo, home)

for entry in repo.glob('*'):
    if entry in ignore:
        continue

    new_entry = home / entry.relative_to(repo)
    if entry.is_file():
        copy(entry, new_entry)
    else:
        copytree(entry, new_entry, dirs_exist_ok=True)

    print(f'{str(entry):40s} -> {str(new_entry):40s}')

