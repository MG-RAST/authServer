package ClientConfig;

require Exporter;

# This is the base url of the authServer
use constant BASE_URL => 'http://localhost/cgi-bin/';

# These values must correspond to what the app was registered with on the
# application registration page of the authServer
use constant APPLICATION_NAME   => "Demo App";
use constant APPLICATION_URL    => "http://localhost/demo-app/index.html";
use constant APPLICATION_SECRET => "";

# This is the name of the cookie the user information will be stored in
use constant COOKIE_NAME => 'AuthWebSession';

@ISA = qw(Exporter);
@EXPORT = qw(BASE_URL APPLICATION_NAME APPLICATION_URL APPLICATION_SECRET COOKIE_NAME);

1;
