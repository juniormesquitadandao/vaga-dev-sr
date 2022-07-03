FROM vaga-dev-sr_app:latest

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip -q awscliv2.zip && \
  ./aws/install && \
  aws --version

COPY --chown=user:user . vaga-dev-sr

WORKDIR /home/user/vaga-dev-sr

ENV RAILS_ENV=production
ENV NODE_ENV=production

RUN bundle install && \
  npm install

RUN rails assets:precompile && \
  mv .aws ~/.aws && \
  cd public/assets && \
  aws s3 sync . s3://juniormesquitadandao/assets/vaga-dev-sr && \
  cd ../../ && \
  rails assets:clobber && \
  rm -rf node_modules && \
  rm -rf ~/.aws

ARG ARG_DATABASE_URL
RUN DATABASE_URL=$ARG_DATABASE_URL rails db:create db:migrate

CMD ["rails s -d"]
