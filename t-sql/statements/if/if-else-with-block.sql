if db_name() = 'PROD'
  begin

    print('Updating Production DB');
    update tq84_bla set x = x * 2;

  end
else
  begin

    print('Updating Test DB');
    update tq84_bla set x = x - 10;

  end
