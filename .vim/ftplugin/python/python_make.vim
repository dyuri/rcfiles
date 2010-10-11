set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

python << EOL
import vim
def EvaluateCurrentRange():
  eval(compile("\n".join(vim.current.range),'','exec'), globals())
EOL
map <F6> :py EvaluateCurrentRange()<CR>
