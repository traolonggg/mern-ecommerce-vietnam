# ⚡ PUSH LÊN GITHUB NHANH

## 🚀 3 BƯỚC ĐƠN GIẢN

### Bước 1: Khởi tạo Git (lần đầu)
```bash
git init
git add .
git commit -m "Initial commit: MERN Ecommerce tiếng Việt"
```

### Bước 2: Tạo repo trên GitHub
1. Vào: https://github.com/new
2. Tên: `mern-ecommerce-vietnam`
3. Click **Create repository**

### Bước 3: Push code
```bash
# Thay YOUR_USERNAME bằng username GitHub của bạn
git remote add origin https://github.com/YOUR_USERNAME/mern-ecommerce-vietnam.git
git branch -M main
git push -u origin main
```

---

## ⚠️ QUAN TRỌNG

### Kiểm tra TRƯỚC KHI PUSH:

```bash
# Kiểm tra file .env KHÔNG được push
git status | findstr .env
```

Nếu thấy `.env`, chạy:
```bash
git rm --cached Backend/.env
```

---

## 🔄 CẬP NHẬT SAU NÀY

```bash
git add .
git commit -m "Mô tả thay đổi"
git push
```

Hoặc dùng script:
```bash
push-to-github.bat
```

---

## 📖 CHI TIẾT

Xem file: **HUONG_DAN_GITHUB.md**

---

**Đơn giản vậy thôi! 🎉**