#!/bin/bash
set -e
cd "$(dirname "$0")"
stale=$(find sources -name '*.json' -mtime +7)
[ -n "$stale" ] && echo "⚠️ Older than 7 days, re-save from browser:" && echo "$stale"
python3 merge_sources.py
cp repositorio.json repositoriogostosodegaymesgaysesafados/
cd repositoriogostosodegaymesgaysesafados
git add repositorio.json
git commit -m "Update $(date +%F)" || echo "No changes"
git push