# 🔄 HƯỚNG DẪN RESTART BACKEND

## ❗ VẤN ĐỀ

Category và Brand vẫn hiển thị mã (ObjectId) thay vì tên vì:
- ✅ Code đã được sửa (thêm populate)
- ❌ Backend CHƯA ĐƯỢC RESTART

## 🔧 CÁCH SỬA

### Bước 1: Dừng Backend hiện tại

Trong terminal đang chạy Backend, nhấn:
```
Ctrl + C
```

### Bước 2: Chạy lại Backend

```bash
cd Backend
npm run server
```

### Bước 3: Kiểm tra

```bash
node test-populate.js
```

Nếu thành công, bạn sẽ thấy:
```
✅ Đã populate!
  Title: Điện thoại
```

### Bước 4: Refresh Frontend

Nhấn **Ctrl+Shift+R** (hard refresh) trên trình duyệt

---

## 🎯 KẾT QUẢ MONG ĐỢI

### Trước (chưa restart):
```
Category: 691d5c5ca3b811a593c82370
Brand: 691d5c5ca3b811a593c82358
```

### Sau (đã restart):
```
Category: Điện thoại
Brand: Apple
```

---

## 💡 LƯU Ý

**Khi nào cần restart Backend?**
- Sau khi sửa code trong thư mục `Backend/`
- Sau khi thay đổi file `.env`
- Sau khi cài thêm package mới

**Nodemon tự động restart?**
- Có, nhưng chỉ khi file thay đổi
- Nếu bạn sửa code bằng editor khác, có thể cần restart thủ công

---

**Hãy restart Backend ngay bây giờ! 🔄**