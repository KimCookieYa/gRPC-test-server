FROM node

MAINTAINER KimCookieYa <min49590@gmail.com>

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN npm install -g pnpm

# Install app dependencies
COPY package.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile

# Bundle app source
COPY . .

EXPOSE 3003
CMD [ "pnpm", "dev" ]
