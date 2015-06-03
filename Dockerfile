FROM hepsiburada/qa-base-box

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN rm -rf /var/lib/apt/lists/*
RUN apt-add-repository ppa:brightbox/ruby-ng -y
RUN apt-add-repository ppa:tanguy-patte/phantomjs -y
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    ruby1.9.3 \
    freetds-dev \
    cowsay \
    zlib1g-dev \
    unzip \
    phantomjs \
    qt5-default \
    qt5-qmake \
    libqt5webkit5-dev

RUN rm -rf /var/lib/apt/lists/*

RUN /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

RUN wget -N https://chromedriver.storage.googleapis.com/2.15/chromedriver_linux64.zip -P /tmp/

RUN unzip /tmp/chromedriver_linux64.zip
RUN chmod +x /tmp/chromedriver
RUN mv /tmp/chromedriver /usr/bin/
RUN ln -sf /usr/share/zoneinfo/Turkey /etc/localtime

RUN echo "%go ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN gem install bundler cucumber bson_ext --verbose

RUN bundle config build.nokogiri --use-system-libraries

