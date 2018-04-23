#!/usr/bin/env python3
'''\
Usage: {} [OPTIONS]

Where options:

    -u, --unused    List files in 'assets' directory that are not linked from
                    the '_posts' directory.
    -b, --broken    List the links in '_posts' for which are there is no
                    corresponding file in 'assets'.
    -h, --help      Display this help and exit.

If no options are given, both unused assets and broken links are shown.
'''
import os
import re
import sys

__doc__ = __doc__.format(os.path.basename(__file__))

def parse_args(args):
    if len(args) == 2:
        if args[1] in ['--unused', '-u']:
            return 'unused'
        if args[1] in ['--broken', '-b']:
            return 'broken'
        if args[1] in ['--help', '-h']:
            print(__doc__)
            sys.exit(0)
    if len(args) == 1:
        return 'all'
    print(__doc__)
    sys.exit(1)

def filenames(root):
    for subdir, _, fnames in os.walk(root):
        for fname in fnames:
            yield os.path.join(subdir, fname)

def contents(fnames):
    for fname in fnames:
        with open(fname) as stream:
            yield stream.read()

def log(seq):
    for item in seq:
        print(item)
        yield item

def search(haystacks):
    pattern = '/assets/.+?[ )"]'
    for haystack in haystacks:
        for match in re.findall(pattern, haystack):
            yield match[1:-1]

def unused():
    '''
    Return sequence of the filenames in 'assets' that are not linked to from
    '_posts'.
    '''
    return sorted(
        set(filenames('assets')) -
        set(search(contents(filenames('_posts'))))
    )

def broken():
    '''
    Return sequence of the links in 'posts' for which there is no corresponding
    file in 'assets'.
    '''
    return sorted(
        set(search(contents(filenames('_posts')))) -
        set(filenames('assets'))
    )

def main():
    command = parse_args(sys.argv)
    if command == 'unused':
        print('\n'.join(unused()))
    elif command == 'broken':
        print('\n'.join(broken()))
    elif command == 'all':
        print('Unused assets:')
        print('\n'.join(unused()))
        print('\nBroken links:')
        print('\n'.join(broken()))
    else:
        assert 0, "Can't reach"

main()

