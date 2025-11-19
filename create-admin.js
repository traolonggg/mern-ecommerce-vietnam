const bcrypt = require("bcrypt");

// Script để tạo admin user
// Chạy script này hoặc sử dụng dữ liệu bên dưới để thêm vào MongoDB Compass

async function createAdminData() {
  const password = "admin123"; // Thay đổi mật khẩu này
  const salt = await bcrypt.genSaltSync(10);
  const hashedPassword = await bcrypt.hash(password, salt);
  
  const adminUser = {
    firstname: "Admin",
    lastname: "User", 
    email: "admin@ecommerce.com",
    mobile: "1234567890",
    password: hashedPassword,
    role: "admin",
    isBlocked: false,
    cart: [],
    wishlist: [],
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  console.log("Admin User Data:");
  console.log(JSON.stringify(adminUser, null, 2));
  return adminUser;
}

// Chạy function
createAdminData().catch(console.error);

module.exports = { createAdminData };