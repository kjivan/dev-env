#!/bin/bash
# Claude Code status line: starship prompt · model · context used
input=$(cat)
dir=$(jq -r '.workspace.current_dir' <<<"$input")
# Drop starship's leading blank line and trailing prompt-character line so it fits on one line.
prompt=$(cd "$dir" && STARSHIP_SHELL= starship prompt | sed '/^$/d;$d' | tr -d '\n')
# effort is only present for models that support it.
model=$(jq -r '.model.display_name + (if .effort.level then " (\(.effort.level))" else "" end)' <<<"$input")
# used_percentage is null until the first API response, so default to 0.
pct=$(jq -r '.context_window.used_percentage // 0 | floor' <<<"$input")
if ((pct >= 80)); then color='1;31'
elif ((pct >= 50)); then color='1;33'
else color='1;32'
fi
printf '%s%s · \e[%smctx %s%%\e[0m' "$prompt" "$model" "$color" "$pct"
