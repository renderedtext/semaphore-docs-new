FROM ruby:2.3.1

# Install node
RUN wget -O - https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz | tar Jx --strip=1 -C /usr/local

ENV BUNDLE_PATH="/gems"
ENV BUNDLE_BIN_PATH="/gems/bin"
ENV BUNDLE_APP_CONFIG="/gems"

WORKDIR /app

ENV MIDDLEMAN_HOST="0.0.0.0"
CMD ./server
