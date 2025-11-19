# 📋 THÔNG TIN DỰ ÁN ECOMMERCE

## 🔐 TÀI KHOẢN ADMIN

### Tài khoản chính:
- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã tạo)
- **Role:** admin

## 🌐 TRUY CẬP ỨNG DỤNG

- **Admin Panel:** http://localhost:3001
- **Frontend (Khách hàng):** http://localhost:3000
- **Backend API:** http://localhost:5000

## 📊 DỮ LIỆU ĐÃ TẠO

### Brands (14):
- Apple, Samsung, Sony, LG
- Dell, HP, Lenovo, Asus
- Nike, Adidas, Puma
- Zara, H&M, Uniqlo

### Categories (15):
- Electronics, Smartphones, Laptops, Tablets
- Cameras, Headphones
- Clothing, Shoes, Accessories
- Home & Garden, Sports & Outdoors
- Books, Toys & Games, Beauty & Health

### Colors (14):
- Black, White, Red, Blue, Green
- Yellow, Pink, Gray, Brown, Orange
- Purple, Silver, Gold, Navy

### Blog Categories (9):
- Technology, Fashion, Lifestyle, Travel
- Food, Health, Business, Entertainment

### Sample Products (3):
1. **iPhone 15 Pro Max** - $1,199
2. **Samsung Galaxy S24 Ultra** - $1,099
3. **MacBook Pro 16 inch** - $2,499

### Sample Blogs (3):
1. Top 10 Smartphones of 2024
2. How to Choose the Perfect Laptop
3. Latest Tech Trends in 2024

### Coupons (3):
- **WELCOME10** - Giảm 10%
- **SAVE20** - Giảm 20%
- **MEGA50** - Giảm 50%

## 🚀 CÁCH CHẠY DỰ ÁN

### Cách 1: Chạy tự động
```bash
start-all.bat
```

### Cách 2: Chạy từng ứng dụng
```bash
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

## 📝 CHỨC NĂNG ADMIN PANEL

### 1. Dashboard
- Thống kê tổng quan
- Biểu đồ doanh thu
- Số lượng đơn hàng, khách hàng

### 2. Catalog (Danh mục)
- **Add Product:** Thêm sản phẩm mới
- **Product List:** Danh sách sản phẩm
- **Brand:** Quản lý thương hiệu
- **Brand List:** Danh sách thương hiệu
- **Category:** Quản lý danh mục
- **Category List:** Danh sách danh mục
- **Color:** Quản lý màu sắc
- **Color List:** Danh sách màu sắc

### 3. Orders (Đơn hàng)
- Xem tất cả đơn hàng
- Cập nhật trạng thái đơn hàng
- Chi tiết đơn hàng

### 4. Customers (Khách hàng)
- Danh sách khách hàng
- Block/Unblock khách hàng

### 5. Marketing
- **Add Coupon:** Tạo mã giảm giá
- **Coupon List:** Danh sách mã giảm giá

### 6. Blogs
- **Add Blog:** Tạo bài viết mới
- **Blog List:** Danh sách bài viết
- **Add Blog Category:** Tạo danh mục blog
- **Blog Category List:** Danh sách danh mục blog

## 🛒 CHỨC NĂNG FRONTEND (KHÁCH HÀNG)

- Xem sản phẩm
- Tìm kiếm, lọc sản phẩm
- Chi tiết sản phẩm
- Thêm vào giỏ hàng
- Wishlist (yêu thích)
- Checkout và thanh toán
- Xem lịch sử đơn hàng
- Đánh giá sản phẩm
- Đọc blog

## 🔧 SCRIPTS HỮU ÍCH

### Tạo lại toàn bộ dữ liệu:
```bash
cd Backend
node seed-full-data.js
```

### Kiểm tra tài khoản admin:
```bash
cd Backend
node get-admin-info.js
```

### Sửa role admin:
```bash
cd Backend
node fix-admin-role.js
```

### Test API:
```bash
cd Backend
node test-apis.js
```

## 💡 LƯU Ý

1. **MongoDB phải đang chạy** trước khi khởi động Backend
2. **Backend phải chạy trước** Frontend và Admin
3. **Đăng nhập Admin** tại http://localhost:3001
4. **Đăng nhập Khách hàng** tại http://localhost:3000
5. **Tạo dữ liệu mẫu** trước khi thêm sản phẩm

## 🎯 HƯỚNG DẪN SỬ DỤNG ADMIN PANEL

### Bước 1: Đăng nhập
- Truy cập: http://localhost:3001
- Email: admin@ecommerce.com
- Password: admin123

### Bước 2: Thêm sản phẩm
1. Vào **Catalog** → **Add Product**
2. Điền thông tin sản phẩm
3. Chọn Brand, Category, Color từ dropdown
4. Upload hình ảnh
5. Click **Add Product**

### Bước 3: Quản lý đơn hàng
1. Vào **Orders**
2. Xem danh sách đơn hàng
3. Click vào đơn hàng để xem chi tiết
4. Cập nhật trạng thái đơn hàng

### Bước 4: Tạo mã giảm giá
1. Vào **Marketing** → **Add Coupon**
2. Nhập tên mã (VD: SALE30)
3. Nhập % giảm giá
4. Chọn ngày hết hạn
5. Click **Add Coupon**

## 📞 HỖ TRỢ

Nếu gặp vấn đề, kiểm tra:
1. MongoDB đã chạy chưa
2. Backend logs (xem lỗi API)
3. Frontend console (F12)
4. Network tab để xem API calls

---

**Dự án đã sẵn sàng sử dụng! 🎉**