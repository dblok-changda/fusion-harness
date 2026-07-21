# fusion-harness shell functions — launch the harness from ANY project directory.
# The justfile recipes only work from this repo's root; these functions point at the
# extension by absolute path, so the host picks up whatever cwd you call them from.
#
# Install: source this file from your ~/.zshrc (or paste the functions into your
# functions file), adjusting the path if the repo lives somewhere other than
# $HOME/fusion-harness.
#
#   source "$HOME/fusion-harness/shell/fusion-functions.zsh"

# Fusion-harness: launch the workhorse pair (sonnet-5 plans / terra builds) in any repo.
# Uses subscription OAuth stored by pi (/login): anthropic = Claude sub, openai-codex = Codex sub.
function fusion-workhorse() {
  pi \
    -e "$HOME/fusion-harness/extensions/fusion-harness/fusion-harness.ts" \
    --model openai-codex/gpt-5.6-terra \
    --architect anthropic/claude-sonnet-5 \
    --builder openai-codex/gpt-5.6-terra \
    --architect-thinking xhigh \
    --builder-thinking xhigh \
    "$@"
}

# Fusion-harness: launch the SOTA pair (fable-5 plans / sol builds + hosts) in any repo.
# Frontier tier — costs real money. Same OAuth setup as fusion-workhorse.
function fusion-sota() {
  pi \
    -e "$HOME/fusion-harness/extensions/fusion-harness/fusion-harness.ts" \
    --model openai-codex/gpt-5.6-sol \
    --architect anthropic/claude-fable-5 \
    --builder openai-codex/gpt-5.6-sol \
    --architect-thinking xhigh \
    --builder-thinking xhigh \
    "$@"
}

# Fusion-harness SOTA pair hosted by omp instead of pi (fable-5 plans / sol builds + hosts).
# Two models via the extension's --architect/--builder; children re-invoke omp.
function omp-sota() {
  omp \
    -e "$HOME/fusion-harness/extensions/fusion-harness/fusion-harness.ts" \
    --model openai-codex/gpt-5.6-sol \
    --architect anthropic/claude-fable-5 \
    --builder openai-codex/gpt-5.6-sol \
    --architect-thinking xhigh \
    --builder-thinking xhigh \
    "$@"
}
