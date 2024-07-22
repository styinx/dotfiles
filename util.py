import shutil
from pathlib import Path
from sys import version_info


home = Path().home()
repo = Path(__file__).parent.resolve()
entries = repo.glob('*')
ignore = [
    '.git',
    '__pycache__',
    'install.py',
    'backup.py',
    'util.py',
]


def check():
    if version_info < (3, 8, 0):
        print(f'Python version {version_info} too old')
        exit(1)


def confirm(src: Path, dst: Path):
    result = input(f'Copy {src} -> {dst}? y or n: ')
    if result == 'n':
        print('Canceled')
        exit(1)


def copy(src: Path, dst: Path):

    confirm(src, dst)

    for entry in entries:
        if entry.name in ignore:
            continue

        s_entry = src / entry.name
        d_entry = dst / entry.name

        if s_entry.is_file():
            shutil.copy(s_entry, d_entry)
        else:
            shutil.copytree(s_entry, d_entry, dirs_exist_ok=True)

        print(f'{str(s_entry):40s} -> {str(d_entry):40s}')


check()
