default:
  @just --list

rebuild-pre:
  git add .

rebuild: rebuild-pre
  scripts/system-flake-rebuild.sh

update:
  nix flake update

rebuild-update: update && rebuild

git-push: rebuild-pre
  bash -c 'read -p "Commit Message: " commitMsg; git commit -m "$commitMsg"; git push origin'
