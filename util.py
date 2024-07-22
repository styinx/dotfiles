import shutil
from pathlib import Path
from sys import version_info


def check():
    if version_info < (3, 8, 0):
        print(f'Python version {version_info} too old')
        exit(1)


def confirm(src: Path, dst: Path):
    result = input(f'Copy {src} -> {dst}? y or n: ')
    if result == 'n':
        print('Canceled')
        exit(1)


def copy(src: Path, dst: Path, ignore: [Path]):
    confirm(src, dst)

    for entry in src.glob('*'):
        if entry in ignore:
            continue

        new_entry = dst / entry.relative_to(src)
        if entry.is_file():
            shutil.copy(entry, new_entry)
        else:
            shutil.copytree(entry, new_entry, dirs_exist_ok=True)

        print(f'{str(entry):40s} -> {str(new_entry):40s}')


check()

repo = Path(__file__).parent.resolve()
home = Path().home()

entries = [
    '.git',
    'install.py',
    'backup.py',
    'util.py',
]
