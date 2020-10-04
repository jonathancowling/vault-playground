# !/usr/bin/env sh

KEY_GROUPS[0]="ca"
KEY_GROUPS[1]="vault"
KEY_GROUPS[2]="client"

for group in  "${KEY_GROUPS[@]}"; do
  pushd "$group" > /dev/null
  echo -e "\n---\n$group\n---\n"
  ./genkeys.sh
  popd > /dev/null
done