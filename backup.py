"""
Copy configuration files from home directory to repo directory.
"""
from util import copy, entries, home, repo


ignore = list(map(lambda x : repo / x, entries))

copy(home, repo, ignore)
