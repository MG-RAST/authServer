#!/usr/bin/perl
use strict;
use warnings;
use Net::SMTP;
use POSIX qw(strftime);
use Getopt::Long;

sub usage {
  print "send_mail.pl >>> sends a mail (sic!)\n";
  print "send_mail.pl -from <sender email> -to <recipient email> -subject <email subject> -body <email body>\n";
}

my ($from, $to, $subject, $body);

GetOptions(
    'from=s'    => \$from,
    'to=s'      => \$to,
    'subject=s' => \$subject,
    'body=s'    => \$body
);

unless ($from && $to && $subject && $body) {
  &usage;
  exit 0;
}

my $smtp_host = "smtp.mcs.anl.gov";
my $smtp = Net::SMTP->new($smtp_host, Hello => $smtp_host);
    
unless (defined $smtp) {
  print "could not connect to SMTP host\n";
}
  
my @data = (
	    "To: $to\n",
	    "From: $from\n",
	    "Date: ".strftime("%a, %d %b %Y %H:%M:%S %z", localtime)."\n",
	    "Subject: $subject\n\n",
	    $body
	   );

$smtp->mail('mg-rast');
if ($smtp->to($to)) {
  $smtp->data(@data);
} 
$smtp->quit;

print "mail sent\n";

exit 0;
