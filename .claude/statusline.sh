#!/bin/sh
# Claude Code status line. One jq call parses and formats the input: values are
# type-checked, control chars are stripped (no terminal escape injection), and @sh
# quotes each value so the eval only ever assigns variables.
eval "$(jq -r '
  def str: strings | gsub("[[:cntrl:]]"; "") | select(. != "");
  def pct: numbers | round;
  # Green below 70, yellow from 70, red from 90
  def paint($p): "\u001b[\(if $p >= 90 then 31 elif $p >= 70 then 33 else 32 end)m\(.)\u001b[0m";
  # Rate-limit window: 5-block bar (20% per block) plus condensed reset time
  # (9:00AM -> 9a). resets_at is bounded because jq aborts, uncatchably, on
  # out-of-range times.
  def window($label; $fmt):
    (.used_percentage | pct) as $p
    | ([range(5)] | map(if . < ($p / 20 | floor) then "█" else "░" end) | join("")) as $bar
    | ((.resets_at | numbers | select(. > 0 and . < 1e11) | strflocaltime($fmt)
        | sub(":00"; "") | sub("AM$"; "a") | sub("PM$"; "p")) // "") as $reset
    | "\($label) \($bar) \($p)% ↻\($reset)" | paint($p);
  @sh "model=\((.model.display_name | str) // "Unknown Model")",
  @sh "worktree=\((.worktree.name | str) // "")",
  @sh "cost=\((.cost.total_cost_usd | numbers) // 0)",
  @sh "cwd=\((.worktree.original_cwd | str) // (.workspace.current_dir | str) // "")",
  @sh "ctx=\(((.context_window.used_percentage | pct) // 0) as $p | "\($p)%" | paint($p))",
  @sh "rl=\([(.rate_limits.five_hour // empty | window("5h"; "%-I:%M%p")),
            (.rate_limits.seven_day // empty | window("7d"; "%a %-I:%M%p"))] | join(" | "))",
  @sh "lines=\([(.cost.total_lines_added | numbers | select(. > 0) | " \u001b[32m+\(.)\u001b[0m"),
               (.cost.total_lines_removed | numbers | select(. > 0) | " \u001b[31m-\(.)\u001b[0m")] | join(""))"
')"

# Branch (or "HEAD" when detached). Line counts come from the input rather than git
# diff, which would run commands from the repo's own config (core.fsmonitor, clean filters).
branch=$( { git symbolic-ref --short -q HEAD || git rev-parse --abbrev-ref HEAD; } 2>/dev/null) || branch="no branch"
top=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null) || top=${cwd%/}

printf '🤖 %s | 🧠 %s | 💰 $%.2f | ⏱️ %s\n📁 %s | 🌳 %s | 🌿 %s%s' \
  "$model" "$ctx" "$cost" "$rl" "${top##*/}" "${worktree:-no worktree}" "$branch" "$lines"
