set quoted_identifier on
------------------------

--
--  With quoted_identifier on, text that is enclosed in
--  quotation marks is interpreted as identifiers. In the
--  following statement, these identifiers are the name
--  of the table being craeted and its column names
--
    create table "quoted identifier test" (
      "col one"  varchar(10),
      "col two"  varchar(10)
    );

--  Because quotes indicate an identifer rather than a
--  string, the following print statement would cause:
--      Msg 128: The name "hello" is not permitted in this context.
--
--  print("hello 1");

--
--  With quoted identifiers, strings must be enclosed in single quotes:
--
    print('hello 2');

    insert into "quoted identifier test" values ( 'one' , 'foo' );

--
--  It is always possible to
    insert into [quoted identifier test] values ( 'two' , 'bar' );

--
--  Strings can never be enclosed in square brackets, regardless of the
--  setting of quoted_identifier. The following print statement would
--  cause the error message
--      Msg 128, Level 15, State 1,
--      The name "hello 3" is not permitted in this context....
--
--  print([hello 3]);

set quoted_identifier off
-------------------------

--
--  If quoted_identifier is set to off, text that is enclosed in quotation
--  marks is interpreted as strings.
--  Therefore, in the following statement, "quoted identifier test" is
--  taken to be a string and would cause the error message:
--      Msg 102, Level 15, State 1...
--      Incorrect syntax near 'quoted identifier test'.
--
--  insert into "quoted identifier test" values ( 'two' , 'bar' );
--

--
--  In order to refer to an identifier with spaces etc., the identifier
--  must be enclosed in square brackets.
--
    insert into [quoted identifier test] values ("three", "baz");
    print("hello 4");

--  Never works:
--  print([hello 5]);

    drop table [quoted identifier test];
