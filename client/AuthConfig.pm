package AuthConfig;

require Exporter;

# This is the base url of the authServer
use constant AUTH_URL => 'http://localhost:8001/auth/cgi-bin';

# This is the CGI directory of the app that contains authclient.cgi
use constant APPLICATION_CGI_URL => "http://localhost:8002/myApp/cgi-bin";

# These values must correspond to what the app was registered with on the
# application registration page of the authServer
use constant APPLICATION_NAME   => "myApp";
use constant APPLICATION_URL    => "http://localhost:8002/myApp/index.html";
use constant APPLICATION_SECRET => "abXYffLyDabuyxXN8vstbsaMdNwpMKfk";

# This is the expiration time and name of the cookie the user information will be stored in
use constant COOKIE_EXPIRATION => '+2d';
use constant COOKIE_NAME => 'AuthWebSession';

@ISA = qw(Exporter);
@EXPORT = qw(AUTH_URL APPLICATION_CGI_URL APPLICATION_NAME APPLICATION_URL APPLICATION_SECRET COOKIE_EXPIRATION COOKIE_NAME);

1;
