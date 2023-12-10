# 1. Menggunakan base image Node.js versi 14.
FROM node:14

# 2. Menentukan working directory untuk container adalah /app.
WORKDIR /app

# 3. Menyalin seluruh source code ke working directory di container.
COPY . /app

# 4. Menentukan agar aplikasi berjalan dalam production mode
#    dan menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# 5. Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# 6. Ekspos bahwa port yang digunakan oleh aplikasi adalah 8080.
EXPOSE 8080

# 7. Saat container diluncurkan, jalankan server dengan perintah npm start.
CMD ["npm", "start"]
