FROM alpine

# Create app directory

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

RUN echo "hello-world"
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source

CMD [ "echo", "hello-again" ]