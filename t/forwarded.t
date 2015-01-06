use Mojo::Base -strict;

use Test::More;
use Mojolicious::Lite;
use Test::Mojo;

plugin 'RemoteAddr';

get '/ip' => sub {
  my $self = shift;
  $self->render( text => $self->remote_addr );
};

# IP from transaction
my $t = Test::Mojo->new;

# IP from X-Forwarded-For header
$t->ua->on( start => sub {
    my ( $ua, $tx ) = @_;
    $tx->req->headers->header( 'X-Forwarded-For', '2.2.2.2' );
});

$t->get_ok('/ip')->status_is(200)->content_is('2.2.2.2', 'IP from X-Forwarded-For header');

done_testing();
