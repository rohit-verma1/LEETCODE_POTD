FROM ruby:3.2-alpine

# Add Jekyll dependencies to Alpine
RUN apk update && \
    apk add --no-cache build-base gcc cmake git tzdata vips-dev curl

# Update gems and bundler
RUN gem update --system && \
    gem install bundler

# Set working directory
WORKDIR /srv/jekyll

# Copy Gemfile and install dependencies
COPY Gemfile* ./
RUN bundle install

# Expose Jekyll default port
EXPOSE 4000

# Run Jekyll serve
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--force_polling"]
