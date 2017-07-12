package OAuthConfig;

require Exporter;

use constant SESSION_COOKIE_NAME => 'AuthWebSession';
use constant SESSION_TIMEOUT => "+2d";

use constant USER_DB => '/db/user.db';

use constant ADMIN_EMAIL => "mg-rast\@rt.mcs.anl.gov";

use constant BASE_URL => '144.221.76.245/seqcenter-app';
use constant IMAGE_DIR => '/images/';
use constant JS_DIR => '/js/';
use constant CSS_DIR => '/css/';

use constant ALLOW_REGISTER_APPLICATION => 0;
use constant ALLOW_REGISTER_USER => 1;
use constant TRUSTED => "ANL Sequencing Core";

use constant APPLICATION_NAME => "Argonne Sequencing Center";
use constant APPLICATION_URL => "https://144.221.76.245/seqcenter-app/index.html";

use constant SHOCK_URL => "http://shock.metagenomics.anl.gov/node/";
use constant SHOCK_AUTH => "";
use constant APP_SECRET => "";
use constant DBI_CONNECT => "dbi:SQLite:dbname=".USER_DB;

use constant MYSQL_USER_NAME => "";
use constant MYSQL_USER_PASSWORD => "";


use constant SMTP => "smtp.mcs.anl.gov";

@ISA = qw(Exporter);
@EXPORT = qw(SESSION_COOKIE_NAME USER_DB SESSION_TIMEOUT ADMIN_EMAIL BASE_URL IMAGE_DIR JS_DIR CSS_DIR ALLOW_REGISTER_APPLICATION ALLOW_REGISTER_USER APPLICATION_NAME TRUSTED APPLICATION_URL SMTP SHOCK_URL SHOCK_AUTH DBI_CONNECT APP_SECRET);

1;
