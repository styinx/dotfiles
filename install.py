"""
Copy configuration files from repository directory to home directory.
"""
from util import confirm, recurse, home, repo, exceptions


confirm(repo, home)

recurse(repo, repo, home, exceptions)

