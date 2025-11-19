# Hướng dẫn Setup và Chạy Dự án MERN Ecommerce

## Yêu cầu hệ thống
- Node.js (v14 trở lên)
- MongoDB (local hoặc MongoDB Atlas)
- Git

## Bước 1: Cài đặt MongoDB (nếu chưa có)

### Cách 1: MongoDB Local
1. Tải MongoDB Community Server từ: https://www.mongodb.com/try/download/community
2. Cài đặt và khởi động MongoDB service
3. MongoDB sẽ chạy trên port 27017 (mặc định)

### Cách 2: MongoDB Atlas (Cloud)
1. Tạo tài khoản tại: https://www.mongodb.com/atlas
2. Tạo cluster miễn phí
3. Lấy connection string và thay thế trong file `Backend/.env`

## Bước 2: Cấu hình Environment Variables

Chỉnh sửa file `Backend/.env`:
```env
MONGODB_URL=mongodb://localhost:27017/ecommerce
JWT_SECRET=your_secure_jwt_secret_key_here
MAIL_ID=your_email@gmail.com
MP=your_email_app_password
CLOUD_NAME=your_cloudinary_name
API_KEY=your_cloudinary_api_key
API_SECRET=your_cloudinary_api_secret
PORT=5000
```

### Lấy Cloudinary credentials (cho upload ảnh):
1. Đăng ký tại: https://cloudinary.com/
2. Vào Dashboard để lấy Cloud Name, API Key, API Secret

### Cấu hình Email (cho gửi email):
1. Sử dụng Gmail App Password thay vì mật khẩu thường
2. Bật 2-factor authentication và tạo App Password

## Bước 3: Chạy ứng dụng

### Cách 1: Chạy từng ứng dụng riêng biệt

**Terminal 1 - Backend:**
```bash
cd Backend
npm run server
```

**Terminal 2 - Frontend:**
```bash
cd Frontend
npm start
```

**Terminal 3 - Admin:**
```bash
cd Admin
npm start
```

### Cách 2: Chạy tất cả cùng lúc (Windows)
```bash
start-all.bat
```

## Bước 4: Truy cập ứng dụng

- **Frontend (Khách hàng):** http://localhost:3000
- **Admin Panel:** http://localhost:3001
- **Backend API:** http://localhost:5000

## Tính năng chính

### Frontend (Khách hàng):
- Đăng ký/Đăng nhập
- Xem sản phẩm
- Thêm vào giỏ hàng
- Thanh toán
- Xem lịch sử đơn hàng
- Đánh giá sản phẩm

### Admin Panel:
- Quản lý sản phẩm
- Quản lý danh mục
- Quản lý đơn hàng
- Quản lý người dùng
- Thống kê doanh thu
- Quản lý blog

### Backend API:
- RESTful API
- JWT Authentication
- File upload với Cloudinary
- Email notifications
- Payment integration (Razorpay)

## Troubleshooting

### Lỗi thường gặp:

1. **MongoDB connection error:**
   - Kiểm tra MongoDB đã khởi động chưa
   - Kiểm tra connection string trong .env

2. **Port đã được sử dụng:**
   - Thay đổi port trong file cấu hình
   - Hoặc kill process đang sử dụng port

3. **CORS error:**
   - Backend đã cấu hình CORS, nếu vẫn lỗi kiểm tra URL

4. **Dependencies error:**
   - Xóa node_modules và chạy lại npm install
   - Kiểm tra phiên bản Node.js

## Cấu trúc Database

Dự án sẽ tự động tạo các collections:
- users
- products
- categories
- brands
- colors
- blogs
- orders
- coupons
- enquiries

## Tài khoản Admin mặc định

Sau khi chạy lần đầu, tạo tài khoản admin qua API hoặc đăng ký trực tiếp trên giao diện.