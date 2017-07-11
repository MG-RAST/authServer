#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

use DBI;
use CGI;
use JSON;
use LWP::UserAgent;

use OAuthConfig;

my $cgi = new CGI;

# get request method
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
my $request_method = $ENV{'REQUEST_METHOD'};

if (lc($request_method) eq 'options') {
  print $cgi->header(-Access_Control_Allow_Origin => '*',
		     -status => 200,
		     -type => 'text/plain',
		     -charset => 'UTF-8',
		     -Access_Control_Allow_Methods => 'POST, GET, OPTIONS, PUT, DELETE',
		     -Access_Control_Allow_Headers => 'AUTH, AUTHORIZATION, CONTENT-TYPE'
		    );
  print "";
  exit 0;
}

my $agent = LWP::UserAgent->new;
$agent->timeout(600);
my $json = JSON->new();
$json->max_size(0);
my $dbh = dbh();
my @args = (('Authorization', "mgrast vgnLMF7i6KYm5T6EkMNuapHNn"));
my $url = 'http://shock.metagenomics.anl.gov/node/';

my ($su, $perm) = auth();
$cgi->param('type', 'run-folder-archive-fastq');
unless ($su) {

  my $project = $cgi->param('project_id');
  my $u = $cgi->url(-query=>1);
  if ($u =~ /download/) {
    my $nodeid = $cgi->url(-relative=>1);
    eval {
      my $response = $json->decode($agent->get($url.$nodeid, @args)->content);
      $project = $response->{data}->{attributes}->{project_id};
    };
    if ($@) {
      respond('{ "ERROR": "unable to retrieve node from server ('.$@.')" }', 404);
    }
  } elsif (! $cgi->param('project_id')) {
    respond('{ "ERROR": "missing project" }', 400);
  }
  
  my $can = 0;
  foreach my $r (@$perm) {
    if ($r->{type} eq 'project' && $r->{item} eq $project && $r->{view}) {
      $can = 1;
      last;
    }
  }
  
  unless ($can) {
    respond('{ "ERROR": "insufficient permissions" }', 401);
  }
}

$url .= $cgi->url(-relative=>1, -query=>1);
$url =~ s/;/&/g;

my $response = $agent->get($url, @args)->content;

respond($response);

sub dbh {
  my $connection = DBI->connect("dbi:SQLite:dbname=".USER_DB, "", "", {AutoCommit => 0, PrintError => 1});
  unless ($connection) {
    die "could not open database: $@";
  }
  return $connection;
}

sub auth {
    unless ($cgi->http('HTTP_AUTH')) {
	respond('{ "ERROR": "missing authentication" }', 400);
    }
    
    my $login = $dbh->selectrow_arrayref("SELECT login FROM tokens WHERE token='".$cgi->http('HTTP_AUTH')."'");
    if ($dbh->err()) {
	respond('{ "ERROR": "'.$DBI::errstr.'" }', 500);
    } else {
	if (scalar(@$login)) {
	    $login = $login->[0];
	} else {
	    respond('{ "ERROR": "invalid token" }', 401);
	}
    }
    my $admin = 0;
    my $res = $dbh->selectrow_arrayref("SELECT admin FROM user WHERE login='$login'");
    if ($dbh->err()) {
	respond('{ "ERROR": "'.$DBI::errstr.'" }', 500);
    } else {
	if ($res->[0]) {
	    $admin = 1;
	}
    }
    my $scopes = $dbh->selectall_arrayref("SELECT name FROM scope WHERE user='".$login."'");
    if ($dbh->err()) {
	respond('{ "ERROR": "'.$DBI::errstr.'" }', 500);
    }
    if (ref $scopes && scalar(@$scopes)) {
	@$scopes = map { $_->[0] } @$scopes;
    } else {
	respond('{ "ERROR": "user has no rights" }', 404);
    }
    
    my $rights;
    @$rights = map { { "type" => $_->[0], "item" => $_->[1], "edit" => $_->[2], "view" => $_->[3], "owner" => $_->[4] } } @{$dbh->selectall_arrayref("SELECT type, item, edit, view, owner FROM rights WHERE scope IN ('".join("','", @$scopes)."')")};
    if ($dbh->err()) {
	respond('{ "ERROR": "'.$DBI::errstr.'" }', 500);
    }
    
    return ($admin, $rights);
}

sub respond {
  my ($data, $code) = @_;

  $code = $code || 200;
  
  $dbh->disconnect();
  print $cgi->header(-type => 'application/json',
		     -status => $code,
		     -charset => 'UTF-8',
		     -Content_Length => length $data,
		     -Access_Control_Allow_Origin => '*' );
  print $data;
  exit 0;
}
