Truman's List- University Marketplace Database System

Overview

The Truman's List Database Project is a comprehensive system designed to manage a digital marketplace within a university setting. The goal is to create a platform that allows students to easily buy, sell, and trade various items—such as textbooks, electronics, furniture, and personal items—securely and efficiently. The database serves as the backbone of this platform, storing and organizing all essential information related to users, transactions, items, payments, messages, and meetups.

This project aims to provide a structured, easy-to-use system that improves university students' buying and selling experience. The database ensures that all marketplace activities, including user registration, item listings, payment processing, and message exchanges, are seamlessly integrated into one cohesive platform.

Features

1. User Management: The database stores detailed user information such as names, contact details, and login credentials. Users can act as both buyers and sellers.

2. Item Listings: Items for sale are organized by categories such as electronics, books, clothing, etc. Each listing includes the item's name, description, price, and status (available, sold, or not applicable).

3. Transaction Tracking: Each item purchase is recorded, with the transaction linked to the buyer, the item sold, and the price.

4. Payment Information: Supports different payment methods (credit card, PayPal, or cash), tracking the status of the payment (completed, pending, etc.).

5. Meetup Details: If the transaction involves a physical meeting, the time, location, and status (scheduled, completed, or canceled) of the meetup are recorded.

6. Messaging System: Buyers and sellers can communicate through the platform. Messages between users are stored with timestamps.

7. Tags for Items: Items can be tagged with keywords for easy searching. This allows users to find relevant products quickly.

Database Structure

The database consists of the following tables:

1. USER: Stores information about users, including their names, contact details, and login credentials.

2. CATEGORY: Stores list of categories for different types of items (e.g., electronics, clothing).

3. ITEM: Stores information about items being sold, including the seller’s ID, category, descriptions, status and price.

4. TRANSACTION: Records transactions between buyers and sellers, including the item bought and the total price.

5. PAYMENT: Tracks the payment information for each transaction, including the method and status.

6. MEETUP: Contains details about the meetup location and time for transactions requiring in-person exchange.

7. MESSAGE: Stores messages between users involved in a transaction.

8. TEXT: Contains the actual content of messages between users.

9. TAGS: Manages tags associated with items for search purposes.


How To Use 

1. Set up the database using the source code in MySQL.

2. Update the database connection details in the Python source file with your credentials.

3. Once the database is set up and configured, you can run the Python script to interact with the database. The script allows you to execute various operations such as registering users, adding items, making transactions, etc. 

for users:

1. register a user account.
Use the Python script to add a new user to the database. Example Python code:

def register_user(first_name, last_name, email, password):
    query = """
    INSERT INTO USER (first_name, last_name, email, password)
    VALUES (%s, %s, %s, %s);
    """
    cursor.execute(query, (first_name, last_name, email, password))
    conn.commit()
    print("User registered successfully!")

# Example of usage
register_user("John", "Doe", "john.doe@example.com", "securepassword")

2. Add an item for sale.
To list an item for sale you can use the following python code.
def add_item(user_id, name, category, description, price, status='available'):
    query = """
    INSERT INTO ITEM (user_id, name, category, description, price, status)
    VALUES (%s, %s, %s, %s, %s, %s);
    """
    cursor.execute(query, (user_id, name, category, description, price, status))
    conn.commit()
    print("Item added successfully!")

# Example of usage
add_item(1, "Used Textbook - Introduction to Biology", "Books", "A used textbook in good condition.", 30.00)

3.  Browse Available Items

def view_all_items():
    # Retrieve all items from the "ITEM" table
    cursor.execute("SELECT * FROM ITEM WHERE Status='Available'")
    items = cursor.fetchall()  # Fetch all rows (items)

    if not items:
        print("No items found.")
        return

    # Display the list of items
    print("Items available:")
    for item in items:  # Iterate through each item
        print(f"Item ID: {item[0]}, Item Name: {item[3]}, Price: {item[7]}, Status: {item[5]}")


By following these steps, users and contributors can easily set up and start interacting with the Database. Whether you're looking to buy, sell, or contribute to the project, these instructions will guide you through the process.
