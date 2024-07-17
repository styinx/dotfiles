from sys import version_info
from pathlib import Path
from shutil import copy, copytree

if version_info < (3, 8, 0):
    print(f'Python version {version_info} too old')
    exit(1)

blacklist = [
    '.git',
    'read.py',
    'write.py'
]

src = Path(__file__).parent.resolve()
dst = Path().home() / 'test'
blackpaths = list(map(lambda x : src / x, blacklist))

for entry in src.glob('*'):
    if entry in blackpaths:
        continue

    new_entry = dst / entry.relative_to(src)
    if entry.is_file():
        copy(entry, new_entry)
    else:
        copytree(entry, new_entry, dirs_exist_ok=True)

    print(f'{str(entry):40s} -> {str(new_entry):40s}')

