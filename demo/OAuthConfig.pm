package OAuthConfig;

require Exporter;

use constant SESSION_COOKIE_NAME => 'AuthWebSession';
use constant SESSION_TIMEOUT => "+2d";

# If using an SQLite db add the path to the db file
use constant USER_DB => '/db/user.db';

use constant ADMIN_EMAIL => "admin@some.where.loc";

use constant BASE_URL => 'http://demo/';
use constant IMAGE_DIR => '/images/';
use constant JS_DIR => '/js/';
use constant CSS_DIR => '/css/';

use constant ALLOW_REGISTER_APPLICATION => 1;
use constant ALLOW_REGISTER_USER => 1;
use constant TRUSTED => "Demo App";

use constant APPLICATION_NAME => "Demo Aplication";
use constant APPLICATION_URL => "http://demo/index.html";

use constant SHOCK_URL => "http://shock.metagenomics.anl.gov/node/";
use constant SHOCK_AUTH => "";
use constant APP_SECRET => "";

# mysql connection
use constant DBI_CONNECT => "dbi:mysql:database=DemoAppUsers;host=db";
use constant DBI_USER    => "authService";
use constant DBI_PASS    => "authServicePassword";

# SQLite connection
# use constant DBI_CONNECT => "dbi:SQLite:dbname=".USER_DB;

use constant MYSQL_USER_NAME => "demo";
use constant MYSQL_USER_PASSWORD => "demo";
use constant SMTP => "smtp.server.local";

# Added 

use constant EMAIL_IS_LOGIN => "" ;
use constant EMAIL_REG_SUFFIX => "" ;
use constant EMAIL_REG_PREFIX => "" ;
use constant EMAIL_REG_SUBJECT => "" ;
use constant EMAIL_SHARE_UNKNOWN_SUFFIX => "";
use constant EMAIL_SHARE_UNKNOWN_PREFIX => "";
use constant EMAIL_SHARE_SUBJECT => "" ;
use constant EMAIL_SHARE_KNOWN => "" ;
use constant SHOCK_PREAUTH_URL => "" ;



@ISA = qw(Exporter);
@EXPORT = qw(DBI_USER DBI_PASS SESSION_COOKIE_NAME USER_DB SESSION_TIMEOUT ADMIN_EMAIL BASE_URL IMAGE_DIR JS_DIR CSS_DIR ALLOW_REGISTER_APPLICATION ALLOW_REGISTER_USER APPLICATION_NAME TRUSTED APPLICATION_URL SMTP SHOCK_URL SHOCK_AUTH DBI_CONNECT APP_SECRET EMAIL_REG_SUFFIX EMAIL_SHARE_UNKNOWN_SUFFIX EMAIL_SHARE_SUBJECT EMAIL_SHARE_KNOWN SHOCK_PREAUTH_URL EMAIL_IS_LOGIN EMAIL_REG_SUBJECT EMAIL_REG_PREFIX EMAIL_SHARE_UNKNOWN_PREFIX);

1;
