# ขั้นแรกให้ใช้ Python base image
FROM python:3.12-slim

# ตั้งค่าตัวแปรสภาพแวดล้อม
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# ตั้งโฟลเดอร์ทำงานใน container
WORKDIR /app

# คัดลอกไฟล์ requirements.txt ไปยัง container และติดตั้ง dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# คัดลอกโค้ดทั้งหมดไปยัง container
COPY . /app/

# เปิดพอร์ต 8000 สำหรับการเชื่อมต่อไปยัง Django development server
EXPOSE 8000

# รันเซิร์ฟเวอร์ Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
