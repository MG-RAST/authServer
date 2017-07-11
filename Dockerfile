
# docker build -t mgrast/auth-server .

# docker rm auth-server ; docker run -d --name auth-server -p 7000:80  mgrast/auth-server

FROM httpd:2.4

# Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
  make \
  perl-modules \
  liburi-perl \
  liburi-encode-perl \
  libwww-perl \
  libjson-perl \
  libdbi-perl \
  libdbd-mysql-perl \
  libdbd-sqlite3-perl \
  libdigest-md5-perl \
  libfile-slurp-perl \
  libhtml-strip-perl \
  liblist-moreutils-perl \
  libcache-memcached-perl \
  libhtml-template-perl \
  libdigest-md5-perl \
  libdigest-md5-file-perl \
  libdatetime-perl \
  libdatetime-format-ISO8601-perl \
  liblist-allutils-perl \
  libposix-strptime-perl \
  libuuid-tiny-perl \
  libmongodb-perl \
  libfreezethaw-perl \
  libtemplate-perl \
  libclass-isa-perl
  
RUN apt-get install -y \
  vim
    
ENV PERL_MM_USE_DEFAULT 1

RUN mkdir -p /db && chmod a+w /db
COPY user.db /db/user.db
RUN chmod a+w /db/user.db

COPY ./cgi-bin ./html /usr/local/apache2/htdocs/

COPY httpd.conf /usr/local/apache2/conf/

