# ⚡ HƯỚNG DẪN NHANH

## 🚀 KHỞI ĐỘNG DỰ ÁN

### Bước 1: Thiết lập dữ liệu tiếng Việt
```bash
cd Backend
setup-vietnam.bat
```

Hoặc chạy từng lệnh:
```bash
cd Backend
node reset-all-data.js
node seed-vietnam-data.js
```

### Bước 2: Khởi động ứng dụng
```bash
# Quay về thư mục gốc
cd ..

# Chạy tất cả
start-all.bat
```

### Bước 3: Truy cập
- **Website:** http://localhost:3000
- **Admin Panel:** http://localhost:3001
- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã đặt)

---

## 🔧 SỬA LỖI NHANH

### Lỗi: Vẫn thấy sản phẩm cũ (Rs., tiếng Anh)
```bash
cd Backend
node reset-all-data.js
node seed-vietnam-data.js
```
Sau đó refresh trang web: **Ctrl+Shift+R**

### Lỗi: Cannot read properties of null
```bash
cd Backend
node clear-cart.js
```
Sau đó refresh trang web

### Lỗi: Admin không đăng nhập được
```bash
cd Backend
node update-admin.js
```

### Lỗi: Sản phẩm không có hình
```bash
cd Backend
node fix-all-data.js
```

---

## 📋 DỮ LIỆU MẪU

### Sản phẩm (6):
1. iPhone 15 Pro Max 256GB - **29,990,000₫**
2. Samsung Galaxy S24 Ultra 512GB - **27,990,000₫**
3. Xiaomi 14 Pro 5G - **15,990,000₫**
4. MacBook Pro 14 inch M3 Pro - **52,990,000₫**
5. Dell XPS 15 9530 - **42,990,000₫**
6. Giày Nike Air Max 270 - **3,290,000₫**

### Mã giảm giá:
- **CHAOBAN** - Giảm 10%
- **GIAMGIA20** - Giảm 20%
- **KHUYENMAI50** - Giảm 50%
- **TETAM** - Giảm 15%

---

## 🎯 CHECKLIST

### Trước khi bắt đầu:
- [ ] MongoDB đã chạy
- [ ] Node.js đã cài đặt
- [ ] Dependencies đã cài (npm install)

### Thiết lập:
- [ ] Chạy `setup-vietnam.bat`
- [ ] Khởi động `start-all.bat`
- [ ] Refresh trang web (Ctrl+Shift+R)

### Kiểm tra:
- [ ] Trang chủ hiển thị sản phẩm tiếng Việt
- [ ] Giá hiển thị VNĐ (₫)
- [ ] Header menu tiếng Việt
- [ ] Admin đăng nhập được

---

## 💡 MẸO

### 1. Hard Refresh
Nếu vẫn thấy dữ liệu cũ:
- **Chrome/Edge:** Ctrl+Shift+R
- **Firefox:** Ctrl+F5
- Hoặc xóa cache trình duyệt

### 2. Kiểm tra Backend
```bash
# Xem logs Backend
# Kiểm tra port 5000 đang chạy
```

### 3. Kiểm tra MongoDB
```bash
# Mở MongoDB Compass
# Kết nối: mongodb://localhost:27017
# Database: ecommerce
```

---

## 📞 HỖ TRỢ

### Các file quan trọng:
- `Backend/seed-vietnam-data.js` - Tạo dữ liệu tiếng Việt
- `Backend/reset-all-data.js` - Xóa tất cả dữ liệu cũ
- `Backend/setup-vietnam.bat` - Script tự động
- `start-all.bat` - Khởi động tất cả

### Tài liệu chi tiết:
- `README_VI.md` - Hướng dẫn đầy đủ
- `HUONG_DAN_VIET_HOA.md` - Chi tiết Việt hóa
- `CAC_LOI_DA_SUA.md` - Các lỗi đã sửa
- `THONG_TIN_ADMIN.md` - Thông tin admin

---

**Chúc bạn thành công! 🎉**