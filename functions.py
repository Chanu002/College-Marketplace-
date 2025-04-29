from datetime import datetime
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password= "Michael@1958",
    database="MARKET"
)

cursor = conn.cursor()

# First Function 

def register_user(email, fname, lname, password, phone_no):
    # Check if email exists
    cursor.execute("SELECT * FROM USER WHERE Email = %s", (email,))
    if cursor.fetchone():
        print("Email already in use")
        return
    
    # Generate unique User_id (you can use AUTO_INCREMENT in MySQL or manage it in Python)
    cursor.execute("SELECT MAX(User_id) FROM USER")
    user_id = (cursor.fetchone()[0] or 0) + 1

    # Insert new user
    cursor.execute("INSERT INTO USER (User_id, Email, Fname, Lname, Password, Phone_no) VALUES (%s, %s, %s, %s, %s, %s)",
                   (user_id, email, fname, lname, password, phone_no))
    conn.commit()
    print(f"User registered successfully. Your USER ID is {user_id}")



#second function 

def create_item(seller_id, category_id, name, date, description, price,password):
    # Check if seller_id exists
    cursor.execute("SELECT * FROM USER WHERE User_id = %s", (seller_id,))
    if not cursor.fetchone():
        print("Invalid entry: Seller ID does not exist.")
        return
    #check if password matches 
    cursor.execute("SELECT * FROM USER WHERE Password = %s", (password,))
    if not cursor.fetchone():
        print("Invalid Password")
        return

    # Check if category_id exists
    cursor.execute("SELECT * FROM CATEGORY WHERE Category_id = %s", (category_id,))
    if not cursor.fetchone():
        print("Invalid entry: Check the Category ID.")
        return
    try:
        formatted_date = datetime.strptime(date, "%Y-%m-%d").date()
    except ValueError:
        print("Invalid entry: Date must be in the format YYYY-MM-DD.")
        return

    # Generate a new item_id
    cursor.execute("SELECT MAX(Item_id) FROM ITEM")
    item_id = (cursor.fetchone()[0] or 0) + 1

    # Insert the item into the database with status explicitly set to 'Available'
    cursor.execute(
        """
        INSERT INTO ITEM (Item_id, Category_id, Seller_id, Name, Posted_date, Description, Price, Status)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """,
        (item_id, category_id, seller_id, name, formatted_date, description, price, 'Available')
    )
    conn.commit()
    print(f"Item registered successfully and your ITEM ID is {item_id}")


#third function

def view_item_details(item_id):
    # Verify that item_id exists in the "ITEM" table
    cursor.execute("SELECT * FROM ITEM WHERE Item_id = %s", (item_id,))
    item = cursor.fetchone()

    if not item:
        print("Item not found.")
        return

    # Retrieve seller_id from the ITEM table
    seller_id = item[1]  # Assuming Seller_id is the second column in the ITEM table

    # Retrieve seller details from the USER table
    cursor.execute("SELECT * FROM USER WHERE User_id = %s", (seller_id,))
    seller = cursor.fetchone()

    if not seller:
        print("Seller not found.")
        return

    # Display item and seller details
    print("Item Details:")
    print(f"ID: {item[0]}, Name: {item[3]}, Description: {item[4]}, Price: {item[7]}, Status: {item[5]}")
    print("Seller Details:")
    print(f"Name: {seller[1]} {seller[2]}, Email: {seller[4]}, Phone: {seller[5]}")



# fourth function 

def buy_item(buyer_id, item_id, date,password):
    # Verify that buyer_id exists in the "USER" table
    cursor.execute("SELECT * FROM USER WHERE User_id = %s", (buyer_id,))
    if not cursor.fetchone():
        print("Purchase failed: Invalid Buyer ID.")
        return
    
    # Verify that password matches   
    cursor.execute("SELECT * FROM USER WHERE Password = %s", (password,))
    if not cursor.fetchone():
        print(" Invalid Password")
        return
    
    # Check if item_id exists and is available in the "ITEM" table
    cursor.execute("SELECT Price FROM ITEM WHERE Item_id = %s AND Status = 'Available'", (item_id,))
    item = cursor.fetchone()
    if not item:
        print("Purchase failed: Item is not available.")
        return

    # Retrieve the item's price
    item_price = item[0]

    # Update item status to "Sold" in the "ITEM" table
    cursor.execute("UPDATE ITEM SET Status = 'Sold' WHERE Item_id = %s", (item_id,))

    # Generate a unique Trans_id
    cursor.execute("SELECT MAX(Trans_id) FROM TRANSACTION")
    trans_id = (cursor.fetchone()[0] or 0) + 1

    # Insert transaction details into the "TRANSACTION" table
    cursor.execute(
        """
        INSERT INTO TRANSACTION (Trans_id, Total_price,Trans_date, Buyer_id, Item_id)
        VALUES (%s, %s, %s, %s, %s)
        """,
        (trans_id, item_price, date, buyer_id, item_id)
    )
    conn.commit()
    print(f"The item is added to your cart. Total price: {item_price}. Your transaction ID is {trans_id}. Please procceed to the payment. Thank you!")


#fifth function


def list_items_by_category(category_id):
    # Verify that category_id exists in the "CATEGORY" table
    cursor.execute("SELECT * FROM CATEGORY WHERE Category_id = %s", (category_id,))
    category = cursor.fetchone()

    if not category:
        print("Category not found.")
        return

    # Retrieve all items where Category_id = category_id and Status = "Available"
    cursor.execute("SELECT * FROM ITEM WHERE Category_id = %s AND Status = 'Available'", (category_id,))
    items = cursor.fetchall()

    if not items:
        print("No items available in this category.")
        return

    # Display the list of items
    print(f"Items available in Category ID {category_id}:")
    for item in items:
        print(f"ID: {item[0]}, Name: {item[3]}, Price: {item[7]}, Description: {item[4]}")


#sixth function

def view_all_categories():
    # Retrieve all categories from the "CATEGORY" table
    cursor.execute("SELECT * FROM CATEGORY")
    categories = cursor.fetchall()

    if not categories:
        print("No categories found.")
        return

    # Display the list of categories
    print("Categories available:")
    for category in categories:
        print(f"Category ID: {category[0]}, Category Name: {category[1]}")


#seventh function


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






