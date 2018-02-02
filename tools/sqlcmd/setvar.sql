:setvar var1 hello
:setvar var2 world

print "$(var1) $(var2)"
go

:setvar words "foo bar baz"
print "$(words)"
go