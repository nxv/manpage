isEscaped = (s, i, c = 0) ->
  '\\' == s[--i] &&
  isEscaped s, i, ++c ||
  c % 2

delComment = (s) ->
  (i=s.indexOf '#') < 0 && s ||
  (isEscaped(s,i) &&
  s[i..] + delComment(s[++i..]) ||
  s[...i])

trimLine = (l) -> l.trim()

mergeLines = (s, i, a) ->
  ('\\'==s[l=--s.length]) *
  !isEscaped(s,l) &&
  (s = s[...l].trim() +
  ' ' + a[++i].trim()
  delete a[i]
  s = mergeLines s,i,a);s

readLines = (scheme) ->
  scheme.split('\n')
  .map(delComment)
  .map(trimLine)
  .map(mergeLines)
  .filter (l) -> l

exports.readLines = readLines