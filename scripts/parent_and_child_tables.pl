#
#   parent_and_child_tables.pl TABLENAME USERNAME PASSWORD DATABASE
#
#   Show Primary Key, dependent child tables and referenced parent
#   tables for TABLENAME.
#
use warnings;
use strict;

use DBI;

my $table_name = shift;

my $username = shift;
my $password = shift;
my $database = shift;
my %attr     = ();

my $dbh = DBI->connect("dbi:ODBC:$database", $username, $password, \%attr) or die;

print "\nPrimary Key\n";
print "  ", $dbh -> primary_key('', '', $table_name), "\n";

print "\nChild Tables\n";

my $res_fk = $dbh->selectall_arrayref("exec sp_fkeys \@pktable_name='$table_name'");

for my $r (@$res_fk) {
  printf("  %-40s | %-20s | %2d | %-60s | %-50s\n", 
    #  $$r[ 0], # PKTABLE_QUALIFIER
    #  $$r[ 1], # PKTABLE_OWNER
    #  $$r[ 2], # PKTABLE_NAME
    #  $$r[ 3], # PKCOLUMN_NAME
    #  $$r[ 4], # FKTABLE_QUALIFIER
    #  $$r[ 5], # FKTABLE_OWNER
       $$r[ 6], # FKTABLE_NAME
       $$r[ 7], # FKCOLUMN_NAME
       $$r[ 8], # KEY_SEQ
    #  $$r[ 9], # UPDATE_RULE [0=Cascade, 1=No action]
    #  $$r[10], # DELETE_RULE [0=Cascade, 1=No action] 
       $$r[11], # FK_NAME
       $$r[12], # PK_NAME

   )
}

print "\nParent Tables\n";

my $res_fk = $dbh->selectall_arrayref("exec sp_fkeys \@fktable_name='$table_name'");

for my $r (@$res_fk) {
  printf("  %-40s | %-20s | %2d | %-60s | %-50s\n", 
    #  $$r[ 0], # PKTABLE_QUALIFIER
    #  $$r[ 1], # PKTABLE_OWNER
       $$r[ 2], # PKTABLE_NAME
    #  $$r[ 3], # PKCOLUMN_NAME
    #  $$r[ 4], # FKTABLE_QUALIFIER
    #  $$r[ 5], # FKTABLE_OWNER
    #  $$r[ 6], # FKTABLE_NAME
       $$r[ 7], # FKCOLUMN_NAME
       $$r[ 8], # KEY_SEQ
    #  $$r[ 9], # UPDATE_RULE [0=Cascade, 1=No action]
    #  $$r[10], # DELETE_RULE [0=Cascade, 1=No action] 
       $$r[11], # FK_NAME
       $$r[12], # PK_NAME

   )
}
