use kb_communitymodeling::kb_communitymodelingImpl;

use kb_communitymodeling::kb_communitymodelingServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = kb_communitymodeling::kb_communitymodelingImpl->new;
    push(@dispatch, 'kb_communitymodeling' => $obj);
}


my $server = kb_communitymodeling::kb_communitymodelingServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
