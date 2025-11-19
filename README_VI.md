# 🛒 DỰ ÁN THƯƠNG MẠI ĐIỆN TỬ MERN STACK

## 📋 GIỚI THIỆU

Dự án website thương mại điện tử hoàn chỉnh được xây dựng bằng MERN Stack (MongoDB, Express.js, React.js, Node.js) với giao diện và dữ liệu tiếng Việt.

## 🎯 TÍNH NĂNG CHÍNH

### Khách hàng:
- ✅ Xem và tìm kiếm sản phẩm
- ✅ Thêm vào giỏ hàng
- ✅ Danh sách yêu thích
- ✅ Đặt hàng và thanh toán
- ✅ Theo dõi đơn hàng
- ✅ Đánh giá sản phẩm
- ✅ Đọc tin tức/blog

### Quản trị viên:
- ✅ Quản lý sản phẩm (thêm/sửa/xóa)
- ✅ Quản lý đơn hàng
- ✅ Quản lý khách hàng
- ✅ Quản lý danh mục, thương hiệu, màu sắc
- ✅ Quản lý blog/tin tức
- ✅ Quản lý mã giảm giá
- ✅ Thống kê doanh thu

## 🛠️ CÔNG NGHỆ SỬ DỤNG

### Backend:
- Node.js & Express.js
- MongoDB & Mongoose
- JWT Authentication
- Bcrypt (mã hóa mật khẩu)
- Cloudinary (upload ảnh)
- Nodemailer (gửi email)
- Razorpay (thanh toán)

### Frontend:
- React.js 18
- Redux Toolkit (state management)
- React Router DOM
- Axios
- React Bootstrap
- Ant Design (Admin Panel)

## 📦 CÀI ĐẶT

### Yêu cầu:
- Node.js (v14+)
- MongoDB
- npm hoặc yarn

### Bước 1: Clone dự án
```bash
git clone <repository-url>
cd Full_MERN_Stack_Ecommerce_Project
```

### Bước 2: Cài đặt dependencies
```bash
# Backend
cd Backend
npm install

# Frontend
cd ../Frontend
npm install

# Admin
cd ../Admin
npm install
```

### Bước 3: Cấu hình môi trường
Tạo file `.env` trong thư mục `Backend`:
```env
MONGODB_URL=mongodb://localhost:27017/ecommerce
JWT_SECRET=your_secret_key_here
MAIL_ID=your_email@gmail.com
MP=your_email_password
CLOUD_NAME=your_cloudinary_name
API_KEY=your_cloudinary_api_key
API_SECRET=your_cloudinary_api_secret
PORT=5000
```

### Bước 4: Tạo dữ liệu mẫu tiếng Việt
```bash
cd Backend
node seed-vietnam-data.js
```

### Bước 5: Chạy dự án
```bash
# Cách 1: Chạy tự động (Windows)
start-all.bat

# Cách 2: Chạy từng ứng dụng
# Terminal 1 - Backend
cd Backend
npm run server

# Terminal 2 - Frontend
cd Frontend
npm start

# Terminal 3 - Admin
cd Admin
npm start
```

## 🌐 TRUY CẬP

- **Website khách hàng:** http://localhost:3000
- **Admin Panel:** http://localhost:3001
- **Backend API:** http://localhost:5000

## 🔐 TÀI KHOẢN ADMIN

- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã đặt)

## 📊 DỮ LIỆU MẪU

### Sản phẩm:
- iPhone 15 Pro Max 256GB - 29,990,000₫
- Samsung Galaxy S24 Ultra 512GB - 27,990,000₫
- Xiaomi 14 Pro 5G - 15,990,000₫
- MacBook Pro 14 inch M3 Pro - 52,990,000₫
- Dell XPS 15 9530 - 42,990,000₫
- Giày Nike Air Max 270 - 3,290,000₫

### Mã giảm giá:
- **CHAOBAN** - Giảm 10%
- **GIAMGIA20** - Giảm 20%
- **KHUYENMAI50** - Giảm 50%
- **TETAM** - Giảm 15%

## 📁 CẤU TRÚC THƯ MỤC

```
Full_MERN_Stack_Ecommerce_Project/
├── Backend/                 # Backend API
│   ├── config/             # Cấu hình database, JWT
│   ├── controller/         # Controllers
│   ├── models/             # MongoDB models
│   ├── routes/             # API routes
│   ├── middlewares/        # Middlewares
│   └── index.js            # Entry point
├── Frontend/               # Website khách hàng
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/          # Pages
│   │   ├── features/       # Redux slices
│   │   └── utils/          # Utilities
│   └── public/
├── Admin/                  # Admin Panel
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/          # Admin pages
│   │   └── features/       # Redux slices
│   └── public/
└── README_VI.md           # File này
```

## 🔧 SCRIPTS HỮU ÍCH

```bash
# Tạo dữ liệu tiếng Việt
cd Backend
node seed-vietnam-data.js

# Kiểm tra tài khoản admin
node get-admin-info.js

# Sửa role admin
node fix-admin-role.js

# Test API
node test-apis.js

# Fix dữ liệu thiếu hình ảnh
node fix-all-data.js
```

## 🐛 TROUBLESHOOTING

### Lỗi: MongoDB connection failed
```bash
# Kiểm tra MongoDB đã chạy chưa
# Windows: Mở Services và tìm MongoDB
# Hoặc chạy: mongod --version
```

### Lỗi: Port already in use
```bash
# Thay đổi port trong file cấu hình
# Hoặc kill process đang sử dụng port
```

### Lỗi: Cannot read properties of undefined (reading 'url')
```bash
# Chạy script fix dữ liệu
cd Backend
node fix-all-data.js
```

## 📚 TÀI LIỆU THAM KHẢO

- [MongoDB Documentation](https://docs.mongodb.com/)
- [Express.js Guide](https://expressjs.com/)
- [React Documentation](https://react.dev/)
- [Redux Toolkit](https://redux-toolkit.js.org/)
- [Ant Design](https://ant.design/)

## 🤝 ĐÓNG GÓP

Mọi đóng góp đều được chào đón! Vui lòng:
1. Fork dự án
2. Tạo branch mới (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Mở Pull Request

## 📝 LICENSE

Dự án này được phân phối dưới giấy phép MIT.

## 📞 LIÊN HỆ

- **Hotline:** 0329 101 240
- **Email:** admin@shopvn.com
- **Website:** http://localhost:3000

---

**Được phát triển với ❤️ bằng MERN Stack**