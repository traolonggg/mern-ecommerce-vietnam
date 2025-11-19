# 📝 HƯỚNG DẪN SETUP TỪNG BƯỚC

## ✅ CHECKLIST TRƯỚC KHI BẮT ĐẦU

- [ ] Node.js đã cài đặt (v14+)
- [ ] MongoDB đã cài đặt và đang chạy
- [ ] Git đã cài đặt (tùy chọn)
- [ ] Trình duyệt web (Chrome, Edge, Firefox)

---

## 🚀 BƯỚC 1: CÀI ĐẶT DEPENDENCIES

### 1.1. Backend
```bash
cd Backend
npm install
```

### 1.2. Frontend
```bash
cd Frontend
npm install
```

### 1.3. Admin
```bash
cd Admin
npm install
```

⏱️ **Thời gian:** ~5-10 phút (tùy tốc độ mạng)

---

## ⚙️ BƯỚC 2: CẤU HÌNH CLOUDINARY

### 2.1. Đăng ký Cloudinary
1. Truy cập: https://cloudinary.com/
2. Click **"Sign Up for Free"**
3. Đăng ký bằng email hoặc Google
4. Xác nhận email

### 2.2. Lấy thông tin API
1. Đăng nhập: https://cloudinary.com/console
2. Vào **Dashboard**
3. Copy 3 thông tin:
   - **Cloud Name** (VD: dqabcxyz)
   - **API Key** (VD: 123456789012345)
   - **API Secret** (VD: abcdefgh...)

### 2.3. Cập nhật file .env
Mở file `Backend/.env` và thay thế:

```env
# Cloudinary - THAY ĐỔI THÔNG TIN NÀY
CLOUD_NAME=your_cloud_name_here    # ← Thay bằng Cloud Name của bạn
API_KEY=your_api_key_here           # ← Thay bằng API Key của bạn
API_SECRET=your_api_secret_here     # ← Thay bằng API Secret của bạn
```

### 2.4. Test Cloudinary
```bash
cd Backend
node test-cloudinary.js
```

Nếu thành công, bạn sẽ thấy: ✅ Kết nối Cloudinary thành công!

📖 **Chi tiết:** Xem file `HUONG_DAN_CLOUDINARY.md`

---

## 🔐 BƯỚC 3: CẤU HÌNH EMAIL (TÙY CHỌN)

### 3.1. Tạo App Password cho Gmail
1. Vào: https://myaccount.google.com/security
2. Bật **2-Step Verification**
3. Vào **App passwords**
4. Tạo password mới cho "Mail"
5. Copy password (16 ký tự)

### 3.2. Cập nhật file .env
```env
# Email - THAY ĐỔI THÔNG TIN NÀY
MAIL_ID=your_email@gmail.com       # ← Email của bạn
MP=your_app_password_here           # ← App password (16 ký tự)
```

⚠️ **Lưu ý:** Không dùng mật khẩu Gmail thường, phải dùng App Password!

---

## 💾 BƯỚC 4: THIẾT LẬP DATABASE

### 4.1. Kiểm tra MongoDB đang chạy
```bash
# Windows: Mở Services, tìm MongoDB
# Hoặc chạy: mongod --version
```

### 4.2. Xóa dữ liệu cũ (nếu có)
```bash
cd Backend
node reset-all-data.js
```

### 4.3. Tạo dữ liệu tiếng Việt
```bash
node seed-vietnam-data.js
```

Hoặc chạy cả 2 bước cùng lúc:
```bash
setup-vietnam.bat
```

✅ **Kết quả:** 
- 6 sản phẩm tiếng Việt
- 14 thương hiệu
- 12 danh mục
- 4 blog
- 4 mã giảm giá

---

## 🎯 BƯỚC 5: KHỞI ĐỘNG ỨNG DỤNG

### 5.1. Cách 1: Tự động (Khuyến nghị)
```bash
# Từ thư mục gốc
start-all.bat
```

### 5.2. Cách 2: Thủ công
Mở 3 terminal riêng biệt:

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

⏱️ **Thời gian:** ~30 giây để khởi động

---

## 🌐 BƯỚC 6: TRUY CẬP VÀ KIỂM TRA

### 6.1. Mở trình duyệt
- **Website:** http://localhost:3000
- **Admin Panel:** http://localhost:3001

### 6.2. Đăng nhập Admin
- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã đặt)

### 6.3. Kiểm tra
- [ ] Trang chủ hiển thị sản phẩm
- [ ] Giá hiển thị VNĐ (₫)
- [ ] Menu tiếng Việt
- [ ] Admin đăng nhập được
- [ ] Upload hình được (nếu đã setup Cloudinary)

---

## 🔧 BƯỚC 7: TEST UPLOAD HÌNH (TÙY CHỌN)

### 7.1. Vào Admin Panel
http://localhost:3001

### 7.2. Thêm sản phẩm mới
1. Vào **Catalog** → **Add Product**
2. Điền thông tin sản phẩm
3. Kéo thả hình ảnh vào ô upload
4. Click **Add Product**

### 7.3. Kiểm tra
- Hình hiển thị trên website
- Hình lưu trên Cloudinary

---

## ✅ HOÀN TẤT!

### Bạn đã có:
- ✅ Backend API chạy trên port 5000
- ✅ Frontend chạy trên port 3000
- ✅ Admin Panel chạy trên port 3001
- ✅ Database với dữ liệu tiếng Việt
- ✅ Cloudinary để upload hình
- ✅ Email để gửi thông báo (nếu đã setup)

### Tiếp theo:
- 📖 Đọc `README_VI.md` để hiểu thêm về dự án
- 🎨 Xem `HUONG_DAN_VIET_HOA.md` để biết đã Việt hóa gì
- 🔧 Xem `CAC_LOI_DA_SUA.md` nếu gặp lỗi

---

## 🆘 GẶP VẤN ĐỀ?

### Lỗi: MongoDB connection failed
```bash
# Kiểm tra MongoDB đã chạy chưa
# Windows: Services → MongoDB
```

### Lỗi: Port already in use
```bash
# Đóng ứng dụng đang dùng port
# Hoặc thay đổi port trong code
```

### Lỗi: Cloudinary upload failed
```bash
# Kiểm tra .env đã đúng chưa
cd Backend
node test-cloudinary.js
```

### Lỗi: Vẫn thấy dữ liệu cũ
```bash
# Xóa cache trình duyệt
# Hoặc Ctrl+Shift+R (hard refresh)
cd Backend
setup-vietnam.bat
```

---

## 📞 HỖ TRỢ

### Tài liệu:
- `START_HERE.md` - Bắt đầu nhanh
- `HUONG_DAN_NHANH.md` - Hướng dẫn nhanh
- `HUONG_DAN_CLOUDINARY.md` - Setup Cloudinary
- `README_VI.md` - Hướng dẫn đầy đủ

### Scripts hữu ích:
```bash
cd Backend

# Setup tất cả
setup-vietnam.bat

# Test Cloudinary
node test-cloudinary.js

# Kiểm tra admin
node get-admin-info.js

# Test API
node test-apis.js
```

---

**Chúc bạn setup thành công! 🎉**