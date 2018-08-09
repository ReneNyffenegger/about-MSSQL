create table tq84_xml (
  id  integer primary key,
  doc xml
)

insert into tq84_xml  values (1,
'<tq84>
  <foo>hello wordl</foo>
  <bar>
    <baz>42</baz>
  </bar>
</tq84>'
);

select
  doc.value('(//foo)[1]'    , 'varchar(max)') bar,
  doc.value('(//bar/baz)[1]', 'integer'     ) bar_baz
from
  tq84_xml;

drop table tq84_xml;
