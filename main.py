import functions  

def main():
    while True:
        print("\n==== Marketplace Menu ====")
        print("1. Register User")
        print("2. Create Item")
        print("3. View Item Details")
        print("4. Buy Item")
        print("5. List Items by Category")
        print("6. View All Categories")
        print("7. View All Items")
        print("0. Exit")
        print("==========================")
        
        try:
            choice = int(input("Enter your choice: "))
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        if choice == 0:
            print("Exiting the marketplace. Goodbye!")
            break
        elif choice == 1:
            email = input("Enter email: ")
            fname = input("Enter first name: ")
            lname = input("Enter last name: ")
            password = input("Enter password: ")
            phone_no = input("Enter phone number: ")
            functions.register_user(email, fname, lname, password, phone_no)  
        elif choice == 2:
            seller_id = int(input("Enter seller ID: "))
            password = input("Enter password:")
            category_id = int(input("Enter category ID: "))
            name = input("Enter item name: ")
            date = input("Enter posting date (YYYY-MM-DD): ")
            description = input("Enter item description: ")
            price = float(input("Enter item price: "))
            functions.create_item(seller_id, category_id, name, date, description, price,password)  
        elif choice == 3:
            item_id = input("Enter item ID:")
            functions.view_item_details(item_id)
        elif choice == 4:
            buyer_id = int(input("Enter buyer ID: "))
            password = input("Enter password :")
            item_id = int(input("Enter item ID: "))
            date = input("Enter purchase date (YYYY-MM-DD): ")
            functions.buy_item(buyer_id, item_id, date,password)
        elif choice == 5:
            category_id = int(input("Enter category ID: "))
            functions.list_items_by_category(category_id)
        elif choice == 6:
            functions.view_all_categories()
        elif choice == 7:
            functions.view_all_items()
        else:
            print("Invalid choice. Please select a valid option.")

if __name__ == "__main__":
    main()
