"""
Copy configuration files from home directory to repo directory.
"""
from util import confirm, recurse, home, repo, exceptions


confirm(home, repo)

recurse(repo, home, repo, exceptions)
