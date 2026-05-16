((string_content) @injection.content
  (#match? @injection.content "\\s*--\\s*sql")
  (#set! injection.language "sql"))
((string_content) @injection.content
  (#match? @injection.content "\\s*/\\*\\s*sql\\s*\\*/")
  (#set! injection.language "sql"))
(macro_invocation
  macro: (_) @macro_name
  (#match? @macro_name "(query(_scalar)?(_unchecked)?)$")
  (_
    .
    (_
      ((string_content) @injection.content
        (#set! injection.language "sql")))))
(macro_invocation
  macro: (_) @macro_name
  (#match? @macro_name "(query_as(_unchecked)?)$")
  (_
    (_
      ((string_content) @injection.content
        (#set! injection.language "sql")))))
