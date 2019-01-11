FROM debian:stable-slim

ARG LAM_VERSION=6.6-1
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -qq --no-install-recommends --no-install-suggests install \
        wget \
        ca-certificates \
    && cd \tmp && wget http://prdownloads.sourceforge.net/lam/ldap-account-manager_${LAM_VERSION}_all.deb \
    && DEBIAN_FRONTEND=noninteractive apt -yq --no-install-recommends --no-install-suggests install /tmp/ldap-account-manager_${LAM_VERSION}_all.deb php-zip php-xml \
    && apt-get -yq clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "apache2ctl" ]
CMD [ "-DFOREGROUND" ]
