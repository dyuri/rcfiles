function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  __bobthefish_colors base16-dark

  set -l base00 263238
  set -l base01 383830
  set -l base02 314549
  set -l base03 75715e
  set -l base04 a59f85
  set -l base05 f8f8f2 # White
  set -l base06 f5f4f1
  set -l base07 f9f8f5
  set -l base08 F92672 # red
  set -l base09 F4BF75 # orange
  set -l base0A f4bf75 # yellow
  set -l base0B A6E22E # green
  set -l base0C 00c0dc # cyan
  set -l base0D 66D9EF # blue
  set -l base0E ae81ff # violet
  set -l base0F cc6633 # brown
  
  set -l base0G 488b0d # green su  
  set -l base0H 66D9EF # adapta
  
  set -l colorfg $base02

  set -x color_initial_segment_exit     $base05 $base08 --bold
  set -x color_initial_segment_su       $base05 $base0B --bold
  set -x color_initial_segment_jobs     $base05 $base0D --bold

  set -x color_path                     $base02 $base05
  set -x color_path_basename            $base02 $base06  --bold
  set -x color_path_nowrite             $base08 $colorfg  
  set -x color_path_nowrite_basename    $base08 $colorfg  --bold

  set -x color_repo                     $base0B $colorfg --bold
  set -x color_repo_work_tree           $base02 $colorfg --bold
  set -x color_repo_dirty               $base08 $colorfg --bold
  set -x color_repo_staged              $base09 $colorfg --bold

  set -x color_vi_mode_default          $base0H $colorfg --bold
  set -x color_vi_mode_insert           $base0B $colorfg --bold
  set -x color_vi_mode_visual           $base09 $colorfg --bold

  set -x color_vagrant                  $base0E $colorfg  --bold
  set -x color_username                 $base00 $base05  --bold
  set -x color_hostname                 $base00 $base05  --bold
  set -x color_rvm                      $base08 $colorfg  --bold
  set -x color_virtualfish              $base0D $colorfg  --bold
  set -x color_virtualgo                $base0D $colorfg  --bold
  set -x color_desk                     $base0D $colorfg  --bold
end

