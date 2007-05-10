
use Test::More qw/no_plan/;
use Egg::Helper::VirtualTest;

my $t= Egg::Helper::VirtualTest->new( prepare => {
  controller => { egg_includes => [qw/ Net::Scan /] },
  });

ok my $e= $t->egg_context;
ok my $scan= $e->port_scan('127.0.0.1', 666, timeout=> 1 );
ok   $scan->is_error;
like $scan->is_error, qr{Cannot\s+connect\s+\d+};
