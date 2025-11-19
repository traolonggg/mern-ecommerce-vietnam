# 🔐 THÔNG TIN TÀI KHOẢN ADMIN

## ✅ TÀI KHOẢN ADMIN CHÍNH

### Tài khoản hiện tại:
- **Email:** duckhuy207@gmail.com
- **Password:** (mật khẩu bạn đã đặt khi đăng ký)
- **Role:** admin
- **Trạng thái:** Active (không bị block)

## 🌐 TRUY CẬP ADMIN PANEL

- **URL:** http://localhost:3001
- **Đăng nhập với:** duckhuy207@gmail.com

## 📋 QUYỀN HẠN ADMIN

### Quản lý sản phẩm:
- ✅ Thêm sản phẩm mới
- ✅ Sửa thông tin sản phẩm
- ✅ Xóa sản phẩm
- ✅ Upload hình ảnh sản phẩm

### Quản lý danh mục:
- ✅ Thêm/Sửa/Xóa Brand (Thương hiệu)
- ✅ Thêm/Sửa/Xóa Category (Danh mục)
- ✅ Thêm/Sửa/Xóa Color (Màu sắc)

### Quản lý đơn hàng:
- ✅ Xem tất cả đơn hàng
- ✅ Cập nhật trạng thái đơn hàng
- ✅ Xem chi tiết đơn hàng

### Quản lý khách hàng:
- ✅ Xem danh sách khách hàng
- ✅ Block/Unblock khách hàng
- ✅ Xem thông tin chi tiết

### Quản lý nội dung:
- ✅ Thêm/Sửa/Xóa Blog
- ✅ Thêm/Sửa/Xóa Blog Category
- ✅ Quản lý mã giảm giá (Coupon)

### Thống kê:
- ✅ Dashboard tổng quan
- ✅ Doanh thu theo tháng
- ✅ Số lượng đơn hàng
- ✅ Biểu đồ thống kê

## 🔧 CÁCH CẬP NHẬT ADMIN

### Nếu cần thêm admin mới:
```bash
cd Backend
node update-admin.js
```

### Kiểm tra danh sách admin:
```bash
cd Backend
node get-admin-info.js
```

### Sửa role thành admin:
```bash
cd Backend
node fix-admin-role.js
```

## 📝 LƯU Ý

1. **Bảo mật:**
   - Không chia sẻ mật khẩu admin
   - Đổi mật khẩu định kỳ
   - Sử dụng mật khẩu mạnh

2. **Backup:**
   - Backup database thường xuyên
   - Lưu trữ dữ liệu quan trọng

3. **Quyền truy cập:**
   - Chỉ cấp quyền admin cho người tin cậy
   - Theo dõi hoạt động admin

## 🚀 HƯỚNG DẪN SỬ DỤNG

### Bước 1: Đăng nhập
1. Truy cập: http://localhost:3001
2. Nhập email: duckhuy207@gmail.com
3. Nhập mật khẩu của bạn
4. Click "Đăng nhập"

### Bước 2: Thêm sản phẩm
1. Vào menu "Catalog" → "Add Product"
2. Điền thông tin sản phẩm
3. Chọn Brand, Category, Color
4. Upload hình ảnh
5. Click "Add Product"

### Bước 3: Quản lý đơn hàng
1. Vào menu "Orders"
2. Xem danh sách đơn hàng
3. Click vào đơn hàng để xem chi tiết
4. Cập nhật trạng thái đơn hàng

### Bước 4: Tạo mã giảm giá
1. Vào menu "Marketing" → "Add Coupon"
2. Nhập tên mã (VD: GIAMGIA30)
3. Nhập % giảm giá
4. Chọn ngày hết hạn
5. Click "Add Coupon"

## 📊 DỮ LIỆU MẪU ĐÃ TẠO

### Sản phẩm: 6
- iPhone 15 Pro Max 256GB
- Samsung Galaxy S24 Ultra 512GB
- Xiaomi 14 Pro 5G
- MacBook Pro 14 inch M3 Pro
- Dell XPS 15 9530
- Giày Nike Air Max 270

### Thương hiệu: 14
Apple, Samsung, Xiaomi, Oppo, Vivo, Realme, Dell, HP, Asus, MSI, Nike, Adidas, Biti's, Ananas

### Danh mục: 12
Điện thoại, Laptop, Máy tính bảng, Tai nghe, Đồng hồ thông minh, Phụ kiện điện thoại, Thời trang nam, Thời trang nữ, Giày dép, Túi xách, Đồ gia dụng, Mỹ phẩm

### Mã giảm giá: 4
- CHAOBAN (10%)
- GIAMGIA20 (20%)
- KHUYENMAI50 (50%)
- TETAM (15%)

## 🆘 HỖ TRỢ

Nếu gặp vấn đề:
1. Kiểm tra Backend đang chạy (port 5000)
2. Kiểm tra MongoDB đã kết nối
3. Xem console logs để debug
4. Kiểm tra Network tab trong Developer Tools

---

**Admin Panel đã sẵn sàng sử dụng! 🎉**