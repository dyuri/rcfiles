#!/bin/env nu

use std

def jjprompt [] {
  let cmd = which jj
  if ($cmd | length) < 1 {
    return
  }

  jj root --quiet --ignore-working-copy o+e> (std null-device)
  if $env.LAST_EXIT_CODE != 0 {
    return
  }

  jj log --ignore-working-copy --no-graph --color never -r @ -T '
      separate(
          " ",
          branches.join(", "),
          coalesce(
              surround(
                  "\"",
                  "\"",
                  if(
                      description.first_line().substr(0, 24).starts_with(description.first_line()),
                      description.first_line().substr(0, 24),
                      description.first_line().substr(0, 23) ++ "…"
                  )
              ),
              "(no desc.)"
          ),
          change_id.shortest(),
          commit_id.shortest(),
          if(conflict, "󱐋"),
          if(empty, "󰟢"),
          if(divergent, "󱡷"),
          if(hidden, "󰘓"),
          if(immutable, ""),
      )
  '
}

jjprompt

