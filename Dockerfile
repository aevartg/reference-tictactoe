FROM node
# ADD . /app
WORKDIR /app
# COPY package.json .
COPY . .
RUN npm install --silent
RUN ls
ENV NODE_PATH .
EXPOSE 3000
CMD ["./run.sh"]
