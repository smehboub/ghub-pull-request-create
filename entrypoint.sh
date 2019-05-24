#!/bin/sh

[ -z $GHUB_PR_FROM ] && GHUB_PR_FROM=$(echo "$GITHUB_REF" | sed -e 's|refs/remotes/||g' -e 's|refs/remotes/origin/||g' -e 's|refs/heads/||g')
[ -z $GHUB_PR_TITLE ] && GHUB_PR_TITLE="Merge $GHUB_PR_FROM into $GHUB_PR_INTO"
[ -z $GHUB_PR_BODY ] && GHUB_PR_BODY=""
set -eu
ghub pull-request create --token="$GITHUB_TOKEN" --repo="$GITHUB_REPOSITORY" --title="$GHUB_PR_TITLE" --body="$GHUB_PR_BODY" --into="$GHUB_PR_INTO" --from="$GHUB_PR_FROM"
