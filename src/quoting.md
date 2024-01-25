# Quoting

<style>
  #content table.bash3 tbody td:nth-child(1) { width: 25%; }
  #content table.bash3 tbody td:nth-child(2) { width: 25%; }
</style>

Bash has many expressions that denote the same string.

## Unquoted strings

Unquoted strings are the simplest form of string.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh hello "" -->
    <!-- cmdrun /book/echo.sh 007 "Numbers are not evaluated" -->
    <!-- cmdrun /book/echo.sh -t "Not only alphanumeric!" -->
  </tbody>
</table>

*Shell expansion* still applies to unquoted strings. We will talk about it later.

## Escaping

The backslash character `\` produces the next character verbatim.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh '\n' '`\` gives the next character verbatim.' -->
    <!-- cmdrun /book/echo.sh '\\' '...for backslashes as well.' -->
    <!-- cmdrun /book/echo.sh 'foo\ bar' 'Single word, not two!' -->
  </tbody>
</table>

## Multiline strings

If `\` is followed by a newline, both the `\` and the newline are removed.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh $'foo\\\nbar' "" -->
  </tbody>
</table>

## Single quotes

Everything between single quotes is interpreted literally. Even newlines.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh "'hello'" "" -->
    <!-- cmdrun /book/echo.sh "'foo\nbar'" "Backslashes don't work" -->
    <!-- cmdrun /book/echo.sh "'\$HOME'" "Substitution doesn't work" -->
    <!-- cmdrun /book/echo.sh $'\'foo\nbar\'' "Newlines are ok!" -->
  </tbody>
</table>