select dbo.regexp_replace(
           'foo bar baz',
           '([^\s]*)\s*([^\s]*)\s*([^\s]*)',
           'first word: $1, second word: 2: $2, third word: $3, dollar sign: $$.'
       );
--
-- first word: foo, second word: 2: bar, third word: baz, dollar sign: $.
