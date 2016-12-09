# pulls node from docker
FROM node

#sets the path to node
ENV NODE_PATH .

#uses the /app directory as workingdirectory
WORKDIR /app

COPY . .

#installs npm
RUN npm install --silent

#check if copying and installing npm succeeds
RUN ls


EXPOSE 3000

#runs the script
CMD ["./run.sh"]
