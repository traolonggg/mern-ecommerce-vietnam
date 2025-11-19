# 🗄️ GIẢI THÍCH CẤU TRÚC DATABASE

## ❓ TẠI SAO THẤY MÃ THAY VÌ TÊN?

### Ví dụ bạn đang thấy:
```
Category: 691d5c5ca3b811a593c82370
Brand: 691d5c5ca3b811a593c82370
```

Thay vì:
```
Category: Điện thoại
Brand: Apple
```

## 🔍 NGUYÊN NHÂN

### 1. Cách MongoDB lưu trữ quan hệ

MongoDB sử dụng **ObjectId** để tham chiếu giữa các collection:

```javascript
// Collection: products
{
  _id: "abc123",
  title: "iPhone 15 Pro Max",
  price: 29990000,
  category: "691d5c5ca3b811a593c82370",  // ← Đây là ObjectId
  brand: "691d5c5ca3b811a593c82371"      // ← Đây là ObjectId
}

// Collection: categories
{
  _id: "691d5c5ca3b811a593c82370",  // ← ID này
  title: "Điện thoại"               // ← Tên thật
}

// Collection: brands
{
  _id: "691d5c5ca3b811a593c82371",  // ← ID này
  title: "Apple"                    // ← Tên thật
}
```

### 2. Tại sao dùng ObjectId?

**Ưu điểm:**
- ✅ Duy nhất (unique)
- ✅ Không thay đổi
- ✅ Hiệu suất cao
- ✅ Dễ tìm kiếm

**Ví dụ:**
Nếu bạn đổi tên "Điện thoại" → "Smartphone", chỉ cần sửa 1 chỗ trong collection categories, không cần sửa tất cả sản phẩm.

---

## 🔄 CÁCH HIỂN THỊ TÊN THAY VÌ MÃ

### Giải pháp: Populate (MongoDB)

Backend cần "populate" để lấy thông tin đầy đủ:

```javascript
// TRƯỚC (chỉ có ID):
const product = await Product.findById(id);
console.log(product.category); // "691d5c5ca3b811a593c82370"

// SAU (có đầy đủ thông tin):
const product = await Product.findById(id)
  .populate('category')
  .populate('brand');

console.log(product.category.title); // "Điện thoại"
console.log(product.brand.title);    // "Apple"
```

---

## 🐛 VẤN ĐỀ TRONG DỰ ÁN

### Nơi bạn thấy mã:

**1. Trang sản phẩm (Product page)**
```javascript
// Frontend/src/pages/SingleProduct.js
<p>Category: {productState?.category}</p>
// Hiển thị: 691d5c5ca3b811a593c82370
```

**2. Danh sách sản phẩm**
```javascript
// Frontend/src/pages/OurStore.js
<p>Brand: {product?.brand}</p>
// Hiển thị: 691d5c5ca3b811a593c82371
```

### Nguyên nhân:

Backend API **CHƯA POPULATE** category và brand khi trả về sản phẩm.

---

## ✅ CÁCH SỬA

### Bước 1: Sửa Backend Controller

File: `Backend/controller/productCtrl.js`

**Tìm function `getaProduct`:**

```javascript
// TRƯỚC (chưa populate):
const getaProduct = asyncHandler(async (req, res) => {
  const { id } = req.params;
  try {
    const findProduct = await Product.findById(id);
    res.json(findProduct);
  } catch (error) {
    throw new Error(error);
  }
});
```

**SAU (đã populate):**

```javascript
const getaProduct = asyncHandler(async (req, res) => {
  const { id } = req.params;
  try {
    const findProduct = await Product.findById(id)
      .populate('category')   // ← Thêm dòng này
      .populate('brand')      // ← Thêm dòng này
      .populate('color');     // ← Thêm dòng này
    res.json(findProduct);
  } catch (error) {
    throw new Error(error);
  }
});
```

### Bước 2: Sửa function `getAllProduct`

```javascript
// TRƯỚC:
const getAllProduct = asyncHandler(async (req, res) => {
  try {
    const getallProducts = await Product.find();
    res.json(getallProducts);
  } catch (error) {
    throw new Error(error);
  }
});
```

**SAU:**

```javascript
const getAllProduct = asyncHandler(async (req, res) => {
  try {
    const getallProducts = await Product.find()
      .populate('category')   // ← Thêm
      .populate('brand')      // ← Thêm
      .populate('color');     // ← Thêm
    res.json(getallProducts);
  } catch (error) {
    throw new Error(error);
  }
});
```

### Bước 3: Restart Backend

```bash
# Dừng Backend (Ctrl+C)
# Chạy lại
cd Backend
npm run server
```

### Bước 4: Refresh Frontend

```
Ctrl+Shift+R (hard refresh)
```

---

## 📊 KẾT QUẢ SAU KHI SỬA

### Trước:
```json
{
  "title": "iPhone 15 Pro Max",
  "category": "691d5c5ca3b811a593c82370",
  "brand": "691d5c5ca3b811a593c82371"
}
```

### Sau:
```json
{
  "title": "iPhone 15 Pro Max",
  "category": {
    "_id": "691d5c5ca3b811a593c82370",
    "title": "Điện thoại"
  },
  "brand": {
    "_id": "691d5c5ca3b811a593c82371",
    "title": "Apple"
  }
}
```

### Hiển thị trên Frontend:
```javascript
// Bây giờ có thể dùng:
<p>Category: {productState?.category?.title}</p>  // "Điện thoại"
<p>Brand: {productState?.brand?.title}</p>        // "Apple"
```

---

## 🎯 TÓM TẮT

### Vấn đề:
- Thấy mã `691d5c5ca3b811a593c82370` thay vì tên "Điện thoại"

### Nguyên nhân:
- MongoDB lưu ObjectId để tham chiếu
- Backend chưa populate khi trả về API

### Giải pháp:
1. Thêm `.populate('category')` và `.populate('brand')` trong controller
2. Restart Backend
3. Refresh Frontend
4. Dùng `product.category.title` thay vì `product.category`

### Lợi ích của cách này:
- ✅ Dữ liệu nhất quán
- ✅ Dễ cập nhật
- ✅ Hiệu suất tốt
- ✅ Tránh trùng lặp

---

## 💡 KIẾN THỨC THÊM

### Populate là gì?

Populate giống như **JOIN** trong SQL:

**SQL:**
```sql
SELECT products.*, categories.title as category_name
FROM products
JOIN categories ON products.category_id = categories.id
```

**MongoDB:**
```javascript
Product.find().populate('category')
```

### Khi nào dùng Populate?

**Nên dùng:**
- Khi hiển thị thông tin chi tiết
- Khi cần tên, không chỉ ID

**Không nên dùng:**
- Khi chỉ cần ID để lưu/cập nhật
- Khi cần hiệu suất cao (populate chậm hơn)

---

**Bây giờ bạn hiểu tại sao thấy mã rồi chứ? 😊**