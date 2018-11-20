if      datepart(hour, sysdatetime()) <  7

        print('Too early');

else if datepart(hour, sysdatetime()) < 18

        print('Ok');

else
        print('To late');
