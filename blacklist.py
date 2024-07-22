from sys import version_info

def check():
    if version_info < (3, 8, 0):
        print(f'Python version {version_info} too old')
        exit(1)

def confirm(src, dst):
    result = input(f'Copy {src} -> {dst}? y or n: ')
    if result == 'n':
        print('Canceled')
        exit(1)

blacklist = [
    '.git',
    'load.py',
    'store.py',
    'blacklist.py',
]
