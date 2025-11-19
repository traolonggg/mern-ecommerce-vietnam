# HƯỚNG DẪN HOẠT ĐỘNG DỰ ÁN MERN ECOMMERCE

## 🏗️ KIẾN TRÚC HỆ THỐNG

### 1. Backend (Node.js + Express + MongoDB)
- **Port:** 5000
- **Database:** MongoDB (ecommerce)
- **Authentication:** JWT Token
- **File Upload:** Cloudinary
- **Payment:** Razorpay

### 2. Frontend (React.js - Khách hàng)
- **Port:** 3000
- **State Management:** Redux Toolkit
- **UI Library:** React Bootstrap, React Icons
- **Routing:** React Router DOM

### 3. Admin Panel (React.js - Quản trị)
- **Port:** 3001
- **UI Library:** Ant Design
- **Charts:** Ant Design Plots
- **Rich Text Editor:** React Quill

## 🔄 LUỒNG HOẠT ĐỘNG

### A. KHÁCH HÀNG (Frontend - Port 3000)

#### 1. Đăng ký/Đăng nhập
```
Khách hàng → Đăng ký/Đăng nhập → Backend xác thực → Trả về JWT Token
```

#### 2. Xem sản phẩm
```
Frontend → GET /api/product → Backend → MongoDB → Trả về danh sách sản phẩm
```

#### 3. Thêm vào giỏ hàng
```
Khách hàng chọn sản phẩm → POST /api/user/cart → Lưu vào MongoDB
```

#### 4. Thanh toán
```
Checkout → POST /api/user/order/checkout → Razorpay → Xác nhận thanh toán → Tạo đơn hàng
```

### B. ADMIN (Admin Panel - Port 3001)

#### 1. Đăng nhập Admin
```
Admin → POST /api/user/admin-login → Kiểm tra role="admin" → Trả về JWT Token
```

#### 2. Quản lý sản phẩm
```
Admin → Thêm/Sửa/Xóa sản phẩm → POST/PUT/DELETE /api/product → MongoDB
```

#### 3. Quản lý đơn hàng
```
Admin → Xem đơn hàng → GET /api/user/getallorders → Cập nhật trạng thái
```

## 📊 CẤU TRÚC DATABASE

### Collections chính:
- **users:** Thông tin người dùng (khách hàng + admin)
- **products:** Sản phẩm
- **categories:** Danh mục sản phẩm
- **brands:** Thương hiệu
- **colors:** Màu sắc
- **orders:** Đơn hàng
- **carts:** Giỏ hàng
- **blogs:** Bài viết blog
- **coupons:** Mã giảm giá

## 🔐 HỆ THỐNG AUTHENTICATION

### 1. JWT Token
```javascript
// Khi đăng nhập thành công
const token = generateToken(user._id);
// Frontend lưu token và gửi kèm mỗi request
headers: { Authorization: `Bearer ${token}` }
```

### 2. Middleware xác thực
```javascript
// authMiddleware: Kiểm tra token hợp lệ
// isAdmin: Kiểm tra role = "admin"
```

## 🛒 LUỒNG MUA HÀNG

### 1. Khách hàng
```
Duyệt sản phẩm → Thêm vào giỏ → Xem giỏ hàng → Checkout → Thanh toán → Đơn hàng
```

### 2. Admin
```
Nhận đơn hàng → Xử lý → Cập nhật trạng thái → Giao hàng → Hoàn thành
```

## 📱 TÍNH NĂNG CHÍNH

### Frontend (Khách hàng):
- ✅ Đăng ký/Đăng nhập
- ✅ Xem danh sách sản phẩm
- ✅ Tìm kiếm, lọc sản phẩm
- ✅ Chi tiết sản phẩm
- ✅ Thêm vào giỏ hàng
- ✅ Wishlist (danh sách yêu thích)
- ✅ Checkout và thanh toán
- ✅ Xem lịch sử đơn hàng
- ✅ Đánh giá sản phẩm
- ✅ Blog/Tin tức

### Admin Panel:
- ✅ Dashboard thống kê
- ✅ Quản lý sản phẩm (CRUD)
- ✅ Quản lý danh mục, thương hiệu, màu sắc
- ✅ Quản lý đơn hàng
- ✅ Quản lý khách hàng
- ✅ Quản lý blog
- ✅ Quản lý mã giảm giá
- ✅ Upload hình ảnh
- ✅ Báo cáo doanh thu

## 🔧 API ENDPOINTS CHÍNH

### Authentication:
- `POST /api/user/register` - Đăng ký
- `POST /api/user/login` - Đăng nhập khách hàng
- `POST /api/user/admin-login` - Đăng nhập admin

### Products:
- `GET /api/product` - Lấy tất cả sản phẩm
- `POST /api/product` - Thêm sản phẩm (Admin)
- `PUT /api/product/:id` - Sửa sản phẩm (Admin)
- `DELETE /api/product/:id` - Xóa sản phẩm (Admin)

### Cart & Orders:
- `POST /api/user/cart` - Thêm vào giỏ
- `GET /api/user/cart` - Xem giỏ hàng
- `POST /api/user/cart/create-order` - Tạo đơn hàng

### Categories, Brands, Colors:
- `GET /api/category` - Lấy danh mục
- `GET /api/brand` - Lấy thương hiệu  
- `GET /api/color` - Lấy màu sắc

## 🚀 CÁCH CHẠY DỰ ÁN

### 1. Khởi động tất cả:
```bash
# Chạy script tự động
start-all.bat

# Hoặc chạy từng cái:
cd Backend && npm run server
cd Frontend && npm start  
cd Admin && npm start
```

### 2. Truy cập:
- **Khách hàng:** http://localhost:3000
- **Admin:** http://localhost:3001
- **API:** http://localhost:5000

## 🔍 TROUBLESHOOTING

### 1. Không thêm được sản phẩm:
- Kiểm tra đã tạo Brand, Category, Color chưa
- Chạy: `node Backend/seed-data.js`

### 2. Không đăng nhập được Admin:
- Kiểm tra role trong MongoDB = "admin"
- Chạy: `node Backend/fix-admin-role.js`

### 3. API không hoạt động:
- Kiểm tra Backend đang chạy port 5000
- Test API: `node Backend/test-apis.js`

### 4. Frontend không load dữ liệu:
- Kiểm tra CORS
- Xem Network tab trong Developer Tools
- Kiểm tra JWT token

## 📋 DỮ liệu MẪU ĐÃ TẠO

### Brands: Apple, Samsung, Sony, LG, Nike, Adidas, Zara, H&M
### Categories: Electronics, Smartphones, Laptops, Clothing, Shoes, Accessories, Home & Garden, Sports
### Colors: Black, White, Red, Blue, Green, Yellow, Pink, Gray, Brown, Orange

## 🎯 LUỒNG DEMO

### 1. Admin tạo dữ liệu:
```
Login Admin → Tạo Brand → Tạo Category → Tạo Color → Thêm Product
```

### 2. Khách hàng mua hàng:
```
Đăng ký → Login → Xem sản phẩm → Thêm giỏ hàng → Checkout → Thanh toán
```

### 3. Admin xử lý:
```
Xem đơn hàng → Cập nhật trạng thái → Theo dõi doanh thu
```

Dự án này là một hệ thống ecommerce hoàn chỉnh với đầy đủ tính năng từ frontend khách hàng đến admin panel quản trị!