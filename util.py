from os import getenv
from platform import system
from pathlib import Path
from shutil import copy, copytree
from sys import version_info


SKIP = '-'


def check():
    if version_info < (3, 8, 0):
        print(f'Python version {version_info} too old')
        exit(1)


def confirm(src: Path, dst: Path):
    result = input(f'Copy {src} -> {dst}? y or n: ')
    if result == 'n':
        print('Canceled')
        exit(1)


def recurse(path: Path, src, dst, exceptions: dict):
    for entry in path.glob('*'):
        if entry.name in ignore:
            continue

        postfix = entry.relative_to(repo)
        s_entry = src / postfix
        d_entry = dst / postfix

        if entry.name in exceptions:
            if not isinstance(list(exceptions[entry.name].values())[0], dict):
                if system() not in exceptions[entry.name]:
                    continue
            
                if exceptions[entry.name][system()] == SKIP:
                    continue
            
                exception = exceptions[entry.name][system()] / entry.name
                if src == repo:
                    d_entry = exception
                else:
                    s_entry = exception
            else:
                recurse(entry, src, dst, exceptions[entry.name])
                continue

        if s_entry.is_file():
            copy(s_entry, d_entry)
        else:
            copytree(s_entry, d_entry, dirs_exist_ok=True)

        print(f'{str(s_entry):60s} -> {str(d_entry):60s}')


check()

home = Path().home()
repo = Path(__file__).parent.resolve()

exceptions = {
    '.config' : {
        'nvim' : {
            'Windows': Path(getenv('LOCALAPPDATA'))
        }
    },
    'Documents': {
        'WindowsPowerShell': {
            'Linux': SKIP
        }
    }
}

ignore = [
    '.git',
    '__pycache__',
    'wt',
    'install.py',
    'backup.py',
    'util.py',
]
