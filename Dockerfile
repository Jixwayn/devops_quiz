# ตัวอย่าง Dockerfile ที่ถูกต้อง
FROM node:18

# กำหนด directory ภายใน container
WORKDIR /usr/src/app

# คัดลอก package.json และ package-lock.json เพื่อทำการติดตั้ง dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# คัดลอกไฟล์ทั้งหมดจากโฟลเดอร์ปัจจุบันไปยัง container
COPY . .

# เปิดพอร์ต 3000
EXPOSE 3000

# คำสั่งเริ่มต้นเมื่อ container เริ่ม
CMD ["node", "app.js"]
