# ☁️ CÁCH HOẠT ĐỘNG CỦA CLOUDINARY TRONG DỰ ÁN

## 📋 TỔNG QUAN

Cloudinary được sử dụng để:
- Upload hình ảnh sản phẩm từ Admin Panel
- Lưu trữ hình ảnh trên cloud
- Trả về URL để hiển thị trên website

## 🔄 LUỒNG HOẠT ĐỘNG

### 1. Admin upload hình ảnh

```
Admin Panel → Chọn file → Upload → Backend API → Cloudinary → Trả về URL
```

### 2. Chi tiết từng bước:

#### Bước 1: Admin chọn file
- Vào Admin Panel: http://localhost:3001
- Catalog → Add Product
- Kéo thả hình ảnh vào ô upload

#### Bước 2: Frontend gửi file lên Backend
```javascript
// Admin/src/pages/Addproduct.js
const formData = new FormData();
for (let i = 0; i < images.length; i++) {
  formData.append("images", images[i]);
}

// Gửi POST request
dispatch(uploadImg(formData));
```

#### Bước 3: Backend nhận file
```javascript
// Backend/routes/uploadRoute.js
router.post(
  "/",
  authMiddleware,
  isAdmin,
  uploadPhoto.array("images", 10), // Multer middleware
  productImgResize,                 // Resize image
  uploadImages                      // Upload to Cloudinary
);
```

#### Bước 4: Multer lưu file tạm
```javascript
// Backend/middlewares/uploadImages.js
const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../public/images/"));
  },
  filename: function (req, file, cb) {
    const uniquesuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + "-" + uniquesuffix + ".jpeg");
  },
});

// File được lưu tạm trong: Backend/public/images/
```

#### Bước 5: Sharp resize hình
```javascript
// Backend/middlewares/uploadImages.js
const sharp = require("sharp");

const productImgResize = async (req, res, next) => {
  if (!req.files) return next();
  
  await Promise.all(
    req.files.map(async (file) => {
      await sharp(file.path)
        .resize(300, 300)
        .toFormat("jpeg")
        .jpeg({ quality: 90 })
        .toFile(`public/images/products/${file.filename}`);
      
      fs.unlinkSync(`public/images/products/${file.filename}`);
    })
  );
  next();
};
```

#### Bước 6: Upload lên Cloudinary
```javascript
// Backend/controller/uploadCtrl.js
const uploadImages = async (req, res) => {
  const uploader = (path) => cloudinaryUploadImg(path, "images");
  const urls = [];
  const files = req.files;
  
  for (const file of files) {
    const { path } = file;
    const newpath = await uploader(path);  // Upload to Cloudinary
    urls.push(newpath);
    fs.unlinkSync(path);                   // Xóa file tạm
  }
  
  res.json(urls);
};
```

#### Bước 7: Cloudinary xử lý
```javascript
// Backend/utils/cloudinary.js
const cloudinaryUploadImg = async (fileToUploads) => {
  return new Promise((resolve) => {
    cloudinary.uploader.upload(fileToUploads, (result) => {
      resolve({
        url: result.secure_url,        // URL hình ảnh
        asset_id: result.asset_id,     // ID asset
        public_id: result.public_id,   // ID public
      });
    });
  });
};
```

#### Bước 8: Trả về URL
```json
{
  "url": "https://res.cloudinary.com/dfvvqvv1u/image/upload/v1234567890/images/abc123.jpg",
  "asset_id": "abc123def456",
  "public_id": "images/abc123"
}
```

#### Bước 9: Lưu vào Database
```javascript
// Admin lưu sản phẩm với URL hình
const product = {
  title: "iPhone 15 Pro Max",
  price: 29990000,
  images: [
    {
      public_id: "images/abc123",
      url: "https://res.cloudinary.com/dfvvqvv1u/image/upload/..."
    }
  ]
};
```

#### Bước 10: Hiển thị trên Website
```javascript
// Frontend/src/pages/Home.js
<img src={product.images[0].url} alt={product.title} />
```

---

## 📁 CẤU TRÚC FILES

### Backend:

```
Backend/
├── config/
│   └── (không có file cloudinary config)
├── utils/
│   └── cloudinary.js          ← Cấu hình Cloudinary
├── controller/
│   └── uploadCtrl.js          ← Controller upload
├── middlewares/
│   └── uploadImages.js        ← Multer & Sharp
├── routes/
│   └── uploadRoute.js         ← Route upload
└── public/
    └── images/                ← Lưu file tạm
        └── products/
```

### Admin Panel:

```
Admin/src/
├── pages/
│   └── Addproduct.js          ← Form thêm sản phẩm
└── features/
    └── upload/
        └── uploadSlice.js     ← Redux upload
```

---

## 🔧 CẤU HÌNH

### 1. File .env
```env
CLOUD_NAME=dfvvqvv1u
API_KEY=649427137529644
API_SECRET=_v8PU8KRPuqkaouuuhIoC5aadZA
```

### 2. File cloudinary.js
```javascript
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET,  // ← Đã sửa từ SECRET_KEY
});
```

### 3. Route upload
```javascript
// Backend/routes/uploadRoute.js
router.post(
  "/",
  authMiddleware,              // Kiểm tra đăng nhập
  isAdmin,                     // Kiểm tra admin
  uploadPhoto.array("images", 10),  // Upload max 10 files
  productImgResize,            // Resize 300x300
  uploadImages                 // Upload to Cloudinary
);
```

---

## 🎯 DEMO THỰC TẾ

### Ví dụ upload 1 hình:

**1. Admin chọn file:**
```
File: iphone-15.jpg (2.5 MB)
```

**2. Multer lưu tạm:**
```
Backend/public/images/products/images-1234567890-123456789.jpeg
```

**3. Sharp resize:**
```
300x300 pixels, quality 90%, format JPEG
```

**4. Upload to Cloudinary:**
```
POST https://api.cloudinary.com/v1_1/dfvvqvv1u/image/upload
```

**5. Cloudinary trả về:**
```json
{
  "url": "https://res.cloudinary.com/dfvvqvv1u/image/upload/v1701234567/images/abc123.jpg",
  "public_id": "images/abc123",
  "asset_id": "abc123def456"
}
```

**6. Xóa file tạm:**
```
fs.unlinkSync("Backend/public/images/products/images-1234567890-123456789.jpeg")
```

**7. Lưu vào MongoDB:**
```javascript
{
  _id: "...",
  title: "iPhone 15 Pro Max",
  images: [
    {
      public_id: "images/abc123",
      url: "https://res.cloudinary.com/dfvvqvv1u/image/upload/v1701234567/images/abc123.jpg"
    }
  ]
}
```

**8. Hiển thị trên website:**
```html
<img src="https://res.cloudinary.com/dfvvqvv1u/image/upload/v1701234567/images/abc123.jpg" />
```

---

## 🔍 XÓA HÌNH ẢNH

### Luồng xóa:

```javascript
// 1. Admin click xóa hình
// 2. Frontend gửi public_id
dispatch(delImg(public_id));

// 3. Backend nhận request
router.delete("/delete-img/:id", authMiddleware, isAdmin, deleteImages);

// 4. Gọi Cloudinary API
const cloudinaryDeleteImg = async (fileToDelete) => {
  return new Promise((resolve) => {
    cloudinary.uploader.destroy(fileToDelete, (result) => {
      resolve(result);
    });
  });
};

// 5. Xóa khỏi database
await Product.updateOne(
  { _id: productId },
  { $pull: { images: { public_id: public_id } } }
);
```

---

## 📊 GIỚI HẠN FREE PLAN

### Cloudinary Free:
- ✅ 25 GB storage
- ✅ 25 GB bandwidth/tháng
- ✅ 25,000 transformations/tháng
- ✅ Đủ cho ~5,000 hình ảnh

### Tối ưu:
- Resize hình trước khi upload (300x300)
- Nén chất lượng 90%
- Xóa hình không dùng

---

## 🐛 TROUBLESHOOTING

### Lỗi: Upload failed
```
✅ Kiểm tra .env đã đúng chưa
✅ Restart Backend server
✅ Chạy: node test-cloudinary.js
```

### Lỗi: File too large
```
✅ Giới hạn: 10 MB/file
✅ Resize hình trước khi upload
```

### Lỗi: Invalid credentials
```
✅ Kiểm tra API_KEY và API_SECRET
✅ Regenerate nếu bị lộ
```

---

## 💡 MẸO

### 1. Xem hình trên Cloudinary
- Vào: https://cloudinary.com/console/media_library
- Folder: images/

### 2. Tối ưu hóa
- Cloudinary tự động nén
- Tự động chuyển WebP
- CDN toàn cầu

### 3. Backup
- Download từ Media Library
- Hoặc dùng API

---

**Cloudinary hoạt động hoàn hảo trong dự án! ☁️✨**