package AuthConfig;

require Exporter;


# This is the base url of the authServer, cgi-bin directory
use constant AUTH_URL => $ENV{'AUTH_URL'};

# These values must correspond to what the app was registered with on the
# application registration page of the authServer
use constant APPLICATION_NAME   => $ENV{'APPLICATION_NAME'};
use constant APPLICATION_URL    => $ENV{'APPLICATION_URL'};
use constant APPLICATION_SECRET => $ENV{'APPLICATION_SECRET'};

# This is the name of the cookie the user information will be stored in
use constant COOKIE_NAME => 'AuthWebSession';
use constant COOKIE_EXPIRATION => '+2d';


### variables for back-wards compatibility:
# This is the CGI directory of the app that contains authclient.cgi
use constant APPLICATION_CGI_URL =>  $SELF_URL."/cgi-bin";

###


sub import {
    my ($package, $env_hash) = @_;
    %ENV=%$env_hash
}



@ISA = qw(Exporter);
@EXPORT = qw(SELF_URL AUTH_URL APPLICATION_NAME AUTH_CLIENT_URL APPLICATION_SECRET COOKIE_NAME COOKIE_EXPIRATION APPLICATION_CGI_URL APPLICATION_URL);

1;
