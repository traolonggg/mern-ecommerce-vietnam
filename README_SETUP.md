# 🚀 HƯỚNG DẪN SETUP DỰ ÁN

## ⚡ SETUP NHANH (5 PHÚT)

### Bước 1: Cài đặt dependencies
```bash
cd Backend && npm install
cd ../Frontend && npm install  
cd ../Admin && npm install
```

### Bước 2: Setup dữ liệu
```bash
cd Backend
setup-vietnam.bat
```

### Bước 3: Chạy dự án
```bash
cd ..
start-all.bat
```

### Bước 4: Truy cập
- Website: http://localhost:3000
- Admin: http://localhost:3001 (duckhuy207@gmail.com)

---

## 📚 TÀI LIỆU CHI TIẾT

### Hướng dẫn từng bước:
1. **SETUP_STEP_BY_STEP.md** - Hướng dẫn chi tiết từng bước
2. **HUONG_DAN_CLOUDINARY.md** - Setup Cloudinary để upload hình
3. **HUONG_DAN_NHANH.md** - Hướng dẫn nhanh
4. **START_HERE.md** - Bắt đầu tại đây

### Thông tin dự án:
- **README_VI.md** - Giới thiệu dự án đầy đủ
- **HUONG_DAN_VIET_HOA.md** - Chi tiết Việt hóa
- **CAC_LOI_DA_SUA.md** - Các lỗi đã sửa
- **THONG_TIN_ADMIN.md** - Thông tin admin

---

## ⚙️ CẤU HÌNH CẦN THIẾT

### 1. MongoDB (BẮT BUỘC)
- Cài đặt: https://www.mongodb.com/try/download/community
- Hoặc dùng MongoDB Atlas (cloud)

### 2. Cloudinary (TÙY CHỌN - cho upload hình)
- Đăng ký: https://cloudinary.com/
- Lấy: Cloud Name, API Key, API Secret
- Cập nhật vào `Backend/.env`
- Test: `node Backend/test-cloudinary.js`

📖 **Chi tiết:** `HUONG_DAN_CLOUDINARY.md`

### 3. Gmail (TÙY CHỌN - cho gửi email)
- Tạo App Password
- Cập nhật vào `Backend/.env`

---

## 🔧 FILE CẤU HÌNH

### Backend/.env
```env
# MongoDB (BẮT BUỘC)
MONGODB_URL=mongodb://localhost:27017/ecommerce

# JWT (BẮT BUỘC)
JWT_SECRET=your_jwt_secret_key_here

# Cloudinary (TÙY CHỌN - cho upload hình)
CLOUD_NAME=your_cloud_name
API_KEY=your_api_key
API_SECRET=your_api_secret

# Email (TÙY CHỌN - cho gửi email)
MAIL_ID=your_email@gmail.com
MP=your_app_password

# Server
PORT=5000
```

---

## 🎯 DỮ LIỆU MẪU

### Sau khi chạy `setup-vietnam.bat`:
- ✅ 6 sản phẩm tiếng Việt (giá VNĐ)
- ✅ 14 thương hiệu (có Biti's, Ananas)
- ✅ 12 danh mục tiếng Việt
- ✅ 13 màu sắc tiếng Việt
- ✅ 4 blog tiếng Việt
- ✅ 4 mã giảm giá tiếng Việt

---

## 🔐 TÀI KHOẢN ADMIN

- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã đặt khi đăng ký)
- **URL:** http://localhost:3001

---

## 🛠️ SCRIPTS HỮU ÍCH

### Setup & Reset:
```bash
cd Backend

# Setup tất cả (xóa cũ + tạo mới)
setup-vietnam.bat

# Chỉ xóa dữ liệu cũ
node reset-all-data.js

# Chỉ tạo dữ liệu mới
node seed-vietnam-data.js
```

### Test & Debug:
```bash
# Test Cloudinary
node test-cloudinary.js

# Test API
node test-apis.js

# Kiểm tra admin
node get-admin-info.js

# Cập nhật admin
node update-admin.js
```

### Fix lỗi:
```bash
# Xóa giỏ hàng lỗi
node clear-cart.js

# Sửa dữ liệu thiếu hình
node fix-all-data.js
```

---

## 🆘 TROUBLESHOOTING

### Vẫn thấy dữ liệu cũ (Rs., tiếng Anh)?
```bash
cd Backend
setup-vietnam.bat
# Sau đó: Ctrl+Shift+R (hard refresh)
```

### Lỗi giỏ hàng (Cannot read properties of null)?
```bash
cd Backend
node clear-cart.js
```

### Cloudinary không hoạt động?
```bash
cd Backend
node test-cloudinary.js
# Xem hướng dẫn: HUONG_DAN_CLOUDINARY.md
```

### MongoDB không kết nối được?
```bash
# Kiểm tra MongoDB đã chạy chưa
# Windows: Services → MongoDB Server
```

---

## 📖 ĐỌC THÊM

### Bắt đầu:
1. **START_HERE.md** - Bắt đầu tại đây
2. **SETUP_STEP_BY_STEP.md** - Hướng dẫn từng bước
3. **HUONG_DAN_NHANH.md** - Hướng dẫn nhanh

### Setup chi tiết:
- **HUONG_DAN_CLOUDINARY.md** - Setup Cloudinary
- **README_VI.md** - Giới thiệu dự án

### Thông tin:
- **THONG_TIN_ADMIN.md** - Thông tin admin
- **HUONG_DAN_VIET_HOA.md** - Chi tiết Việt hóa
- **CAC_LOI_DA_SUA.md** - Các lỗi đã sửa

---

## 🎉 KẾT QUẢ

### Sau khi setup xong:
- ✅ Website tiếng Việt
- ✅ Giá VNĐ (₫)
- ✅ Dữ liệu mẫu đầy đủ
- ✅ Admin panel hoạt động
- ✅ Upload hình (nếu đã setup Cloudinary)

---

**Chúc bạn setup thành công! 🚀🇻🇳**