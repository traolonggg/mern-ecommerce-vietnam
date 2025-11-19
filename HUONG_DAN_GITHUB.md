# 🚀 HƯỚNG DẪN ĐẨY CODE LÊN GITHUB

## ⚠️ QUAN TRỌNG: BẢO MẬT TRƯỚC KHI PUSH

### 1. Kiểm tra file .gitignore

Đảm bảo các file sau KHÔNG được push lên GitHub:

```gitignore
# File .gitignore (đã có sẵn)
node_modules/
.env
*.log
.DS_Store
Backend/public/images/
```

### 2. Xóa thông tin nhạy cảm trong file .env

File `Backend/.env` chứa:
- ❌ API_SECRET của Cloudinary
- ❌ JWT_SECRET
- ❌ Email password

**⚠️ File này ĐÃ ĐƯỢC .gitignore, nhưng hãy kiểm tra lại!**

---

## 📝 BƯỚC 1: KHỞI TẠO GIT (nếu chưa có)

```bash
# Kiểm tra đã có git chưa
git status

# Nếu chưa có, khởi tạo
git init
```

---

## 📦 BƯỚC 2: THÊM TẤT CẢ FILE

```bash
# Thêm tất cả file (trừ những file trong .gitignore)
git add .

# Kiểm tra file nào sẽ được commit
git status
```

### ⚠️ Kiểm tra KHÔNG có file .env:

```bash
git status | findstr .env
```

Nếu thấy `.env`, DỪNG LẠI và chạy:
```bash
git rm --cached Backend/.env
```

---

## 💬 BƯỚC 3: COMMIT

```bash
git commit -m "Initial commit: MERN Ecommerce với tiếng Việt và Cloudinary"
```

Hoặc commit chi tiết hơn:
```bash
git commit -m "feat: Hoàn thành dự án MERN Ecommerce

- Việt hóa toàn bộ Frontend
- Tích hợp Cloudinary để upload hình
- Dữ liệu mẫu tiếng Việt
- Định dạng tiền VNĐ
- Populate category/brand
- Admin panel hoàn chỉnh
- Tài liệu đầy đủ"
```

---

## 🌐 BƯỚC 4: TẠO REPOSITORY TRÊN GITHUB

### Cách 1: Qua website

1. Vào: https://github.com/new
2. Điền:
   - **Repository name:** `mern-ecommerce-vietnam`
   - **Description:** `Full MERN Stack Ecommerce với tiếng Việt`
   - **Public** hoặc **Private**
3. **KHÔNG** chọn "Initialize with README" (vì đã có)
4. Click **Create repository**

### Cách 2: Qua GitHub CLI (nếu đã cài)

```bash
gh repo create mern-ecommerce-vietnam --public --source=. --remote=origin
```

---

## 🔗 BƯỚC 5: KẾT NỐI VỚI GITHUB

```bash
# Thay YOUR_USERNAME bằng username GitHub của bạn
git remote add origin https://github.com/YOUR_USERNAME/mern-ecommerce-vietnam.git

# Kiểm tra
git remote -v
```

---

## ⬆️ BƯỚC 6: PUSH CODE

```bash
# Push lần đầu
git push -u origin main

# Hoặc nếu branch là master
git push -u origin master
```

### Nếu gặp lỗi "branch main doesn't exist":

```bash
# Đổi tên branch sang main
git branch -M main

# Push lại
git push -u origin main
```

---

## 🔐 BƯỚC 7: TẠO FILE .env.example

Tạo file mẫu để người khác biết cần cấu hình gì:

```bash
# Tạo file .env.example
```

File `Backend/.env.example`:
```env
# MongoDB
MONGODB_URL=mongodb://localhost:27017/ecommerce

# JWT
JWT_SECRET=your_jwt_secret_key_here

# Cloudinary
CLOUD_NAME=your_cloudinary_cloud_name
API_KEY=your_cloudinary_api_key
API_SECRET=your_cloudinary_api_secret

# Email (Optional)
MAIL_ID=your_email@gmail.com
MP=your_email_app_password

# Server
PORT=5000
```

Commit và push:
```bash
git add Backend/.env.example
git commit -m "docs: Add .env.example"
git push
```

---

## 📝 BƯỚC 8: CẬP NHẬT README

Thêm badge và thông tin vào README.md:

```markdown
# 🛒 MERN Stack Ecommerce - Tiếng Việt

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/YOUR_USERNAME/mern-ecommerce-vietnam)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🌟 Tính năng

- ✅ Full MERN Stack (MongoDB, Express, React, Node.js)
- ✅ Giao diện tiếng Việt
- ✅ Định dạng tiền VNĐ
- ✅ Upload hình ảnh với Cloudinary
- ✅ Admin Panel hoàn chỉnh
- ✅ JWT Authentication
- ✅ Redux Toolkit
- ✅ Responsive design

## 🚀 Cài đặt

Xem file [START_HERE.md](START_HERE.md)

## 📖 Tài liệu

- [Hướng dẫn setup](SETUP_STEP_BY_STEP.md)
- [Setup Cloudinary](HUONG_DAN_CLOUDINARY.md)
- [Giải thích database](GIAI_THICH_DATABASE.md)

## 📞 Liên hệ

- Email: duckhuy207@gmail.com
```

---

## 🔄 CẬP NHẬT SAU NÀY

Khi có thay đổi mới:

```bash
# 1. Thêm file thay đổi
git add .

# 2. Commit
git commit -m "feat: Thêm tính năng XYZ"

# 3. Push
git push
```

---

## 🌿 LÀM VIỆC VỚI BRANCH

### Tạo branch mới:
```bash
git checkout -b feature/ten-tinh-nang
```

### Push branch:
```bash
git push -u origin feature/ten-tinh-nang
```

### Merge vào main:
```bash
git checkout main
git merge feature/ten-tinh-nang
git push
```

---

## 🔒 BẢO MẬT

### ⚠️ TUYỆT ĐỐI KHÔNG PUSH:

- ❌ File `.env`
- ❌ `node_modules/`
- ❌ API keys, passwords
- ❌ Database dumps có dữ liệu thật

### ✅ NÊN PUSH:

- ✅ Source code
- ✅ File `.env.example`
- ✅ Tài liệu
- ✅ Scripts

---

## 🆘 XỬ LÝ LỖI

### Lỗi: "Permission denied"

```bash
# Cấu hình Git credentials
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Hoặc dùng Personal Access Token
# Vào: https://github.com/settings/tokens
# Tạo token mới và dùng thay password
```

### Lỗi: "Repository not found"

```bash
# Kiểm tra remote URL
git remote -v

# Sửa lại nếu sai
git remote set-url origin https://github.com/YOUR_USERNAME/mern-ecommerce-vietnam.git
```

### Đã push nhầm file .env

```bash
# Xóa file khỏi Git history
git rm --cached Backend/.env
git commit -m "Remove .env from repository"
git push

# Sau đó PHẢI regenerate tất cả secrets:
# - Cloudinary API Secret
# - JWT Secret
# - Email password
```

---

## 📊 KIỂM TRA SAU KHI PUSH

1. Vào repository trên GitHub
2. Kiểm tra:
   - [ ] File .env KHÔNG có
   - [ ] node_modules/ KHÔNG có
   - [ ] README.md hiển thị đúng
   - [ ] Tất cả code đã được push

---

## 🎉 HOÀN THÀNH!

Repository của bạn:
```
https://github.com/YOUR_USERNAME/mern-ecommerce-vietnam
```

### Chia sẻ:
- Gửi link cho bạn bè
- Thêm vào CV
- Deploy lên Heroku/Vercel

---

**Code của bạn đã an toàn trên GitHub! 🎊**