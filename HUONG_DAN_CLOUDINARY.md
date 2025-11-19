# ☁️ HƯỚNG DẪN SETUP CLOUDINARY

## 📋 Cloudinary là gì?

Cloudinary là dịch vụ lưu trữ và quản lý hình ảnh trên cloud. Dự án này sử dụng Cloudinary để:
- Upload hình ảnh sản phẩm
- Lưu trữ hình ảnh blog
- Tối ưu hóa hình ảnh tự động

## 🚀 BƯỚC 1: ĐĂNG KÝ TÀI KHOẢN

### 1. Truy cập Cloudinary
- Vào: https://cloudinary.com/
- Click **"Sign Up for Free"**

### 2. Đăng ký
Bạn có thể đăng ký bằng:
- ✅ Email
- ✅ Google Account
- ✅ GitHub Account

### 3. Xác nhận email
- Check email để xác nhận tài khoản
- Click vào link xác nhận

---

## 🔑 BƯỚC 2: LẤY THÔNG TIN API

### 1. Đăng nhập vào Cloudinary
- Vào: https://cloudinary.com/console

### 2. Vào Dashboard
Sau khi đăng nhập, bạn sẽ thấy Dashboard với thông tin:

```
Cloud Name: your_cloud_name
API Key: 123456789012345
API Secret: abcdefghijklmnopqrstuvwxyz
```

### 3. Copy thông tin
- **Cloud Name:** Tên cloud của bạn (VD: dqabcxyz)
- **API Key:** Chuỗi số (VD: 123456789012345)
- **API Secret:** Chuỗi ký tự bí mật

⚠️ **LƯU Ý:** Không chia sẻ API Secret với ai!

---

## ⚙️ BƯỚC 3: CẤU HÌNH TRONG DỰ ÁN

### 1. Mở file `.env` trong thư mục Backend

Nếu chưa có file `.env`, tạo mới:
```bash
cd Backend
# Tạo file .env
```

### 2. Thêm thông tin Cloudinary

Mở file `Backend/.env` và thêm:

```env
# MongoDB
MONGODB_URL=mongodb://localhost:27017/ecommerce

# JWT
JWT_SECRET=your_jwt_secret_key_here

# Email (Gmail)
MAIL_ID=your_email@gmail.com
MP=your_email_app_password

# Cloudinary (QUAN TRỌNG!)
CLOUD_NAME=your_cloud_name_here
API_KEY=your_api_key_here
API_SECRET=your_api_secret_here

# Server
PORT=5000
```

### 3. Thay thế thông tin thực

Ví dụ:
```env
CLOUD_NAME=dqabcxyz
API_KEY=123456789012345
API_SECRET=abcdefghijklmnopqrstuvwxyz123
```

---

## 📸 BƯỚC 4: TEST UPLOAD

### 1. Khởi động Backend
```bash
cd Backend
npm run server
```

### 2. Đăng nhập Admin Panel
- Truy cập: http://localhost:3001
- Đăng nhập: duckhuy207@gmail.com

### 3. Thử upload hình
1. Vào **Catalog** → **Add Product**
2. Kéo thả hình ảnh vào ô upload
3. Nếu thành công, bạn sẽ thấy hình hiển thị

### 4. Kiểm tra trên Cloudinary
- Vào: https://cloudinary.com/console/media_library
- Bạn sẽ thấy hình vừa upload

---

## 🎯 CẤU HÌNH NÂNG CAO (TÙY CHỌN)

### 1. Tạo Folder riêng cho dự án

Trong Admin Panel, khi upload hình, bạn có thể chỉ định folder:

```javascript
// Backend/controller/uploadCtrl.js
const uploadImages = async (req, res) => {
  const uploader = (path) => cloudinaryUploadImg(path, "ecommerce");
  // "ecommerce" là tên folder
};
```

### 2. Giới hạn kích thước file

Trong `Backend/middlewares/uploadImages.js`:

```javascript
const storage = multer.diskStorage({
  // ...
});

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 5 * 1024 * 1024 // 5MB
  }
});
```

### 3. Tối ưu hóa hình ảnh

Cloudinary tự động tối ưu hóa, nhưng bạn có thể cấu hình thêm:

```javascript
// Trong cloudinaryUploadImg function
cloudinary.uploader.upload(fileToUpload, {
  resource_type: "auto",
  folder: folderName,
  transformation: [
    { width: 1000, crop: "limit" },
    { quality: "auto" },
    { fetch_format: "auto" }
  ]
});
```

---

## 🔍 KIỂM TRA CẤU HÌNH

### Script kiểm tra Cloudinary:

Tạo file `Backend/test-cloudinary.js`:

```javascript
const cloudinary = require("cloudinary").v2;
require("dotenv").config();

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET,
});

async function testCloudinary() {
  try {
    console.log("🔍 Kiểm tra kết nối Cloudinary...\n");
    
    console.log("📋 Thông tin cấu hình:");
    console.log("Cloud Name:", process.env.CLOUD_NAME);
    console.log("API Key:", process.env.API_KEY);
    console.log("API Secret:", process.env.API_SECRET ? "✅ Đã cấu hình" : "❌ Chưa cấu hình");
    
    // Test API
    const result = await cloudinary.api.ping();
    console.log("\n✅ Kết nối Cloudinary thành công!");
    console.log("Status:", result.status);
    
  } catch (error) {
    console.error("\n❌ Lỗi kết nối Cloudinary:");
    console.error(error.message);
    console.log("\n💡 Kiểm tra lại:");
    console.log("1. CLOUD_NAME đúng chưa?");
    console.log("2. API_KEY đúng chưa?");
    console.log("3. API_SECRET đúng chưa?");
  }
}

testCloudinary();
```

Chạy test:
```bash
cd Backend
node test-cloudinary.js
```

---

## 🆓 GIỚI HẠN TÀI KHOẢN MIỄN PHÍ

### Cloudinary Free Plan:
- ✅ 25 GB lưu trữ
- ✅ 25 GB băng thông/tháng
- ✅ 25,000 transformations/tháng
- ✅ Đủ cho dự án học tập và demo

### Nếu vượt giới hạn:
- Nâng cấp lên plan trả phí
- Hoặc tạo tài khoản mới
- Hoặc xóa hình cũ không dùng

---

## 🔒 BẢO MẬT

### ⚠️ QUAN TRỌNG:

1. **Không commit file .env lên Git**
   ```bash
   # File .gitignore đã có:
   .env
   ```

2. **Không chia sẻ API Secret**
   - Giữ bí mật API Secret
   - Không đăng lên mạng xã hội
   - Không gửi qua email

3. **Regenerate API Secret nếu bị lộ**
   - Vào Cloudinary Dashboard
   - Settings → Security
   - Regenerate API Secret

---

## 🐛 TROUBLESHOOTING

### Lỗi: "Invalid API Key"
```
✅ Kiểm tra API_KEY trong .env
✅ Đảm bảo không có khoảng trắng thừa
✅ Copy lại từ Cloudinary Dashboard
```

### Lỗi: "Upload failed"
```
✅ Kiểm tra kết nối internet
✅ Kiểm tra file size (max 10MB)
✅ Kiểm tra định dạng file (jpg, png, gif)
```

### Lỗi: "Cloudinary not configured"
```
✅ Kiểm tra file .env tồn tại
✅ Restart Backend server
✅ Chạy: node test-cloudinary.js
```

---

## 📚 TÀI LIỆU THAM KHẢO

- **Cloudinary Docs:** https://cloudinary.com/documentation
- **Node.js SDK:** https://cloudinary.com/documentation/node_integration
- **Upload API:** https://cloudinary.com/documentation/upload_images

---

## 💡 MẸO

### 1. Sử dụng Cloudinary Media Library
- Quản lý hình ảnh trực tiếp trên web
- Tổ chức theo folder
- Xóa hình không dùng

### 2. Tối ưu hóa
- Cloudinary tự động nén hình
- Tự động chuyển đổi format (WebP)
- Lazy loading

### 3. Backup
- Download hình quan trọng về máy
- Hoặc sync với Google Drive

---

**Setup Cloudinary hoàn tất! ☁️✨**