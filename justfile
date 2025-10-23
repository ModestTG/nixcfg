set quiet

default:
  @just --list

rebuild-pre:
  git add . 

rbs: rebuild-pre
  scripts/system-flake-rebuild-switch.sh

rbt: rebuild-pre
  scripts/system-flake-rebuild-test.sh

rbd: rebuild-pre
  scripts/system-flake-rebuild-dry.sh
  
clean:
  nh clean all --keep-since 10d --keep 20
