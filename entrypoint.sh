#!/bin/bash

# エラー時にスクリプトを停止する
set -e

# Remove a potentially pre-existing server.pid for Rails.
# パーミッションに関係なくすべて削除
rm -f /locker_app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
