# Quoting

<style>
  #content table.bash3 tbody td:nth-child(1) { width: 25%; }
  #content table.bash3 tbody td:nth-child(2) { width: 25%; }
</style>

Bash has many expressions that denote the same string.

<div class="warning">

Interpreting string syntax is done by Bash and not by commands themselves. For example, `echo` and `'echo'` are treated exactly the same by Bash:

```bash
$ echo foo
foo

$ 'echo' foo
foo
```

</div>

## Unquoted strings

Unquoted strings are the simplest form of string.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh hello "" -->
    <!-- cmdrun /book/echo.sh 007 "Numbers are not evaluated" -->
    <!-- cmdrun /book/echo.sh -t "Not only alphanumeric\!" -->
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
    <!-- cmdrun /book/echo.sh 'foo\ bar' 'Single word, not two\!' -->
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

Everything between single quotes is interpreted literally, even newlines.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh "'hello'" "" -->
    <!-- cmdrun /book/echo.sh "'foo\nbar'" "Backslashes don't work" -->
    <!-- cmdrun /book/echo.sh "'\$HOME'" "Substitution doesn't work" -->
    <!-- cmdrun /book/echo.sh "'~/foo'" "\`~\` doesn't work" -->
    <!-- cmdrun /book/echo.sh $'\'foo\nbar\'' "Newlines are ok\!" -->
  </tbody>
</table>

## Double quotes

Double quotes allow for:

* shell expansion with `$`,
* command substitution with backticks `` ` ``,
* simple escaping with `\`,
* [history expansion](https://www.thegeekstuff.com/2011/08/bash-history-expansion/) with `!`.

Only these four characters are special. Other characters are not special.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh '"hello"' "" -->
    <!-- cmdrun /book/echo.sh '"home=$HOME"' "Variables are expanded" -->
    <!-- cmdrun /book/echo.sh '"`uname`"' "Command substitution" -->
    <!-- cmdrun /book/echo.sh $'\"foo\nbar\"' "Newlines are still ok\!" -->
    <!-- cmdrun /book/echo.sh '"~/foo"' "\`~\` is not special and remains untouched" -->
    <!-- cmdrun /book/echo.sh '"\$"' "Escaping works for special characters" -->
    <!-- cmdrun /book/echo.sh '"\""' "Escaping works for double quotes" -->
    <!-- cmdrun /book/echo.sh '"\~"' "Escaping doesn't work for non-special characters\!" -->
  </tbody>
</table>

## C quotes

TODO.

## String concatenation

String literals directly next to each other are concatenated.

<table class="bash3">
  <thead><th>Bash</th><th>Raw string</th><th>Notes</th></thead>
  <tbody>
    <!-- cmdrun /book/echo.sh "foo'bar'" "" -->
    <!-- cmdrun /book/echo.sh "\"foo\"'bar'" "" -->
    <!-- cmdrun /book/echo.sh "hello\"'\"" -->
    <!-- cmdrun /book/echo.sh "-d' '" "Same as \`\"-d \"\`" -->
  </tbody>
</table>

## References

* [Bash manual: Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)