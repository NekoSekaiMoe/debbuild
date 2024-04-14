#!/usr/bin/env sh

cleanup() {
test -d source || rm -rf source
}

trap cleanup SIGINT

_() {
  echo "Welcome to use Github History commit."
  printf "Press Year when you want to commit.\m"
  read -r YEAR
  printf "Press Month when you want to commit.\m"
  read -r MONTH
  printf "Press Month when you want to commit.\m"
  read -r YEAR
  printf "Press Day when you want to commit.\m"
  read -r YEAR
  printf "Press Total Time when you want to commit.\m"
  read -r TIME
  echo "Who are you？"
  read -r USERNAME
  printf "Press repository name when you want to commit.\m"
  read -r PROJECT

  printf "Github History Commit written by dabao1955 version 0.0.1"
  git clone "https://github.com/${USERNAME}/${PROJECT}" --depth=1 source
  cd source
  touch .testfile
  git add .
  GIT_AUTHOR_DATE="${YEAR}-${MONTH}-${DAY}T1${TIME}" \
    GIT_COMMITTER_DATE="${YEAR}-${MONTH}-${DAY}T1${TIME}" \
    git commit -m "${YEAR}"
  git push -u origin HEAD -f
  cd ..
  rm -rf source

  echo
  echo "Congratulation! Check your repository now: https://github.com/${USERNAME}/${PROJECT}/commit"
} && _

unset -f _
