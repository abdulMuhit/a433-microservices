#!/bin/bash
 
# Baca token dari file .env
GITHUB_TOKEN=$(grep GITHUB_TOKEN .env | cut -d '=' -f2)
 
# 1. Perintah untuk membuat Docker image
docker build -t karsajobs:latest .
 
# 2. Melihat daftar image di lokal
docker images
 
# 3. Mengubah nama image
docker tag karsajobs:latest ghcr.io/abdulmuhit/karsajobs:latest
 
# 4. Login ke GitHub Packages via Terminal dengan menggunakan token dari .env.
echo "$GITHUB_TOKEN" | docker login ghcr.io -u abdulmuhit --password-stdin
 
# 5. Mengunggah image ke GitHub Packages
docker push ghcr.io/abdulmuhit/karsajobs:latest