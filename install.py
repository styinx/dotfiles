"""
Copy configuration files from repository directory to home directory.
"""
from util import copy, entries, home, repo


ignore = list(map(lambda x : repo / x, entries))

copy(repo, home, ignore)

