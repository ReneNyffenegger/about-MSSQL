declare
   @do_it bit;

set @do_it = 0;


if      @do_it = 1 print('Going to do it'                      )
else if @do_it = 0 print('Not going to do it'                  )
else               print('I am not sure if I am going to do it') 
