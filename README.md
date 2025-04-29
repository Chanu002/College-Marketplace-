
# 📚 Truman's List - University Marketplace Database System

**Truman's List** is a MySQL-based digital marketplace platform designed for university students to **buy, sell, and trade** items securely and efficiently. From textbooks and electronics to furniture and clothing, this system supports a seamless experience for managing listings, transactions, messages, and meetups.

---

## 🚀 Features

- **User Management:** Register and manage user accounts.
- **Item Listings:** Post and browse items by category (e.g., Books, Electronics).
- **Transactions & Payments:** Record item sales and track payment details.
- **Meetups:** Schedule and manage in-person exchange details.
- **Messaging System:** Communicate within the platform using message threads.
- **Searchable Tags:** Tag items for easy filtering and discovery.

---

## 🗃️ Database Tables

- `USER`: User profiles and login credentials  
- `CATEGORY`: Item categories (Books, Electronics, etc.)  
- `ITEM`: Item listings with descriptions and pricing  
- `TRANSACTION`: Records of purchases and sales  
- `PAYMENT`: Payment method and status tracking  
- `MEETUP`: Details for in-person exchanges  
- `MESSAGE`: Communication metadata  
- `TEXT`: Message content  
- `TAGS`: Item tagging for search functionality  

---

## 🛠️ How to Use

### 1. Set Up
- Create the database in **MySQL** using the provided schema.
- Update your **Python script** with the correct database credentials.

### 2. Interact with the System

**Register a User**
```python
register_user("John", "Doe", "john.doe@example.com", "securepassword")
```

**Add an Item for Sale**
```python
add_item(1, "Used Textbook - Intro to Biology", "Books", "Good condition", 30.00)
```

**View Available Items**
```python
view_all_items()
```

---

## 💡 Getting Started

Clone the repository, set up the MySQL schema, and run the Python script to get started with Truman’s List.

---

## 👥 Contributors

Built for university communities by students, for students. Contributions welcome!
