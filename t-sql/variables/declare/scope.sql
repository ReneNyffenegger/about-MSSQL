declare @flag varchar(10) = 'yes';

if @flag = 'yes' begin
   declare @var_yes varchar(10) = 'tq84 yes';
end
else begin
   declare @var_no  varchar(10) = 'tq84 no';
end;

print 'var_yes = ' + coalesce(@var_yes, 'n/a');
print 'var_no  = ' + coalesce(@var_no , 'n/a');
