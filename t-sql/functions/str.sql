declare
   @dec_7_2  decimal(7, 2) = 42.1234;

print '>' + str(@dec_7_2        ) + '<'; -- >        42<
print '>' + str(@dec_7_2, 5     ) + '<'; -- >   42<
print '>' + str(@dec_7_2, 5, 1  ) + '<'; -- > 42.1<