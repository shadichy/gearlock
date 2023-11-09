#!/bin/bash

minifier() {
  echo '#!/bin/bash'
  sed -r ':a;N;$!ba;s/(^(\s*(#.*\n)?|\n+))//gm' "$@" |
    sed -r "s/(=|sayb?r? )(''|\"\")/\1/gm" |
    sed -r 's/"([A-Za-z0-9_.-]+)"/\1/gm' |
    sed -r 's/\)\s+\{/\)\{/gm' |
    sed -r 's/\s*(;|\((\)|\(|!|\?)|[<>][<=>])\s*/\1/gm' |
    sed -r 's/\s+(\))/\1/gm' |
    sed -r 's/==/=/gm' |
    sed -r 's/([^<])\s+</\1</gm' |
    sed -r ':a;N;$!ba;s/([^\\])\\\n/\1 /gm' |
    sed -r ':a;N;$!ba;s/^([^\(]+)\)\s*\n*(.+)$/\1)\2/gm' |
    sed -r ':a;N;$!ba;s/\s*\n*((;|\||&){1,2})\s*\n*/\1/gm' |
    sed -r 's/\s+$//gm' |
    sed -r 's/"\$\?"/\$\?/gm' |
    sed -r "s/\((\"\"|'')\)/\(\)/gm" |
    sed -r 's/ {2,}/ /gm'
}

case "$1" in
-o | --output) out=$2 ;;
-o=* | --output=*) out=${1#*=} ;;
esac

if [ "$out" ]; then
  shift
  shift
  mkdir -p "${out%/*}"
  minifier "$@" >"$out"
else
  minifier "$@"
fi
