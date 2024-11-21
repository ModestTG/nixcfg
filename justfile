set quiet

default:
  @just --list

rebuild-pre:
  git add . 

rbs: rebuild-pre
  scripts/system-flake-rebuild-switch.sh

rbt: rebuild-pre
  scripts/system-flake-rebuild-test.sh

clean:
  doas nh clean all --keep-since 10d --keep 3
