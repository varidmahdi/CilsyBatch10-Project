#image yang tersedia di dockerhub
FROM node:14

#membuat direktori tempat kerja di dalam container untuk file nodejs
WORKDIR /usr/src/app

#mengcopy semua file yang  mengandung nama package.json 
#dengan format <src package*.json>... <dest>
COPY package*.json ./

#menginstall depedensi yang dibutuhkan yang terdapat 
#didalam file package.json
RUN npm install

#mengcopy semua ada dengan format <src>... <dest>
COPY . .

#membuka akses port default untuk nodejs
EXPOSE 3000

#untuk menjalankan nodejs sesuaikan 
#dengan script start yang ada di package.jsom
CMD [ "npm", "start" ]