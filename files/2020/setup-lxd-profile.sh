#!/bin/bash
set -exu

_UID=$(id -u)
GID=$(id -g)

# give lxd permission to map your user/group id through
grep root:$_UID:1 /etc/subuid -qs || sudo usermod --add-subuids ${_UID}-${_UID} --add-subgids ${GID}-${GID} root

# set up a separate key to make sure we can log in automatically via ssh
# with $HOME mounted
KEY=$HOME/.ssh/id_lxd_$USER
PUBKEY=$KEY.pub
AUTHORIZED_KEYS=$HOME/.ssh/authorized_keys
[ -f $PUBKEY ] || ssh-keygen -f $KEY -N '' -C "key for local lxds"
grep "$(cat $PUBKEY)" $AUTHORIZED_KEYS -qs || cat $PUBKEY >> $AUTHORIZED_KEYS

# create a profile to control this, name it after $USER
lxc profile create $USER || true

# configure profile
# this will rewrite the whole profile
cat << EOF | lxc profile edit $USER
name: $USER
description: allow home dir mounting for $USER
config:
  # this part maps uid/gid on the host to the same on the container
  raw.idmap: |
    uid $_UID 1000
    gid $GID 1000
  # note: user.user-data is still available
  user.vendor-data: |
    #cloud-config
    users:
      - name: $USER
        groups: sudo
        shell: $SHELL
        sudo: ['ALL=(ALL) NOPASSWD:ALL']
    # ensure users shell is installed
    packages:
      - bash
# This section adds your \$HOME directory into the container. This is useful for dotfiles.
devices:
  home:
    type: disk
    source: $HOME
    path: $HOME
EOF

# IPv6 in LXD breaks Network manager,
# preventing allocation of IPv4 to containers.
# Fix:
lxc network set lxdbr0 ipv6.address none

# to launch a container using this profile:
# lxc launch ubuntu:16.04 -p default -p $USER <NAME>

# to add an additional bind mount
# lxc config device add NAME DEVICE disk source=/path/on/host path=path/in/container

