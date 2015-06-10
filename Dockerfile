FROM registry-hub.hepsiburada.com:5000/qa-base-box

RUN gem install bundler cucumber bson_ext --verbose

RUN bundle config build.nokogiri --use-system-libraries

RUN echo "192.168.57.91   tags.tiqcdn.com" >> /etc/hosts

