#!/bin/bash

# Usage: ./echo.sh '"foo"' [optional comment]
#
# Output: string itself, its evaluation in bash, and the comment -- all in a table row.

str="$1"
if [[ $# -gt 1 ]]; then
  comment="$2"
fi

echo "<tr>"

echo "<td>"
echo
echo "\`\`\`bash"
echo "$str"
echo "\`\`\`"
echo
echo "</td>"

echo "<td>"
echo
echo "\`\`\`"
eval "arr=( $str ); if [[ \${#arr[@]} -eq 1 ]]; then echo \"\${arr[0]}\"; else echo 'ERROR!!! >1 WORD'; fi"
echo "\`\`\`"
echo
echo "</td>"

if [[ ! -z "${comment+x}" ]]; then
  echo "<td>"
  echo
  echo "$comment"
  echo
  echo "</td>"
fi

echo "</tr>"

