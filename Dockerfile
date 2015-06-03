FROM hepsiburada/qa-base-box


ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN sudo apt-add-repository ppa:brightbox/ruby-ng -y
RUN sudo apt-add-repository ppa:tanguy-patte/phantomjs -y
RUN apt-get update
RUN apt-get install ruby1.9.3 freetds-dev cowsay zlib1g-dev unzip phantomjs qt5-default qt5-qmake libqt5webkit5-dev -y

RUN /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

RUN wget -N https://chromedriver.storage.googleapis.com/2.15/chromedriver_linux64.zip -P /tmp/

RUN unzip /tmp/chromedriver_linux64.zip
RUN chmod +x /tmp/chromedriver
RUN mv /tmp/chromedriver /usr/bin/
RUN ln -sf /usr/share/zoneinfo/Turkey /etc/localtime

RUN echo "%go ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN gem install bundler cucumber bson_ext --verbose

RUN bundle config build.nokogiri --use-system-libraries

#RUN gem install nokogiri rake i18n json minitest thread_safe activesupport addressable bson mime-types rack rack-test xpath capybara capybara-page-object colored launchy capybara-screenshot childprocess multi_json multi_test faker headless mongo netrc progressbar rspec-support rspec-core rspec-expectations rspec-mocks rspec rubyzip websocket selenium-webdriver time_diff capybara-webkit

