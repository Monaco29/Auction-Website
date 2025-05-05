# Auction-Website
This project is a full-featured online auction platform that connects sellers and buyers in a controlled environment with admin oversight. It includes real-time bidding, user authentication, auction room control, and payment tracking.

🔑 Key Features:
🔐 Secure login and registration for Admin, Sellers, and Buyers.

📦 Product listing and auction room creation by verified Sellers.

📝 Buyer auction registration requests approved by Sellers.

🕑 Real-time auction flow control (Start, End, Bid access).

💰 Bidding system with live bid updates and winner announcement.

🧾 Payment system for auction winners and downloadable receipt.

🚚 Parcel tracking for shipped items.

📊 Admin dashboard to manage users, auctions, revenue, and reports.

🛠️ Technologies Used

Frontend - HTML5, CSS3, Bootstrap 4, JavaScript, jQuery, AJAX

Backend	- PHP (Core PHP)

Database - MySQL

Server - Apache (via XAMPP)

Version - Control	Git & GitHub

Tools	- Visual Studio Code, phpMyAdmin


⚙️ Setup Instructions

🔽 How to Unzip the Project

Download the project ZIP file from the repository or from a shared link.

Extract the ZIP file to your preferred location using:

Windows: Right-click → "Extract All"

Mac/Linux: Use default archive manager or unzip command in terminal

Make sure the extracted folder name is simple (e.g., auction_project) and easy to locate.


🚀 How to Run the Project Locally

📁 Step 1: Move to XAMPP htdocs Directory

Open XAMPP Control Panel

Place the extracted folder inside:
C:\xampp\htdocs\ (Windows)
or /Applications/XAMPP/htdocs/ (Mac)

🛠️ Step 2: Start Apache and MySQL

Open XAMPP Control Panel

Click Start for both Apache and MySQL

🗄️ Step 3: Import the Database
Open your browser and go to:
http://localhost/phpmyadmin

Click New, create a database (e.g., auction_db)

Click the database name → Go to Import tab

Choose the .sql file provided inside the project folder

Click Go to import the tables and data

🌐 Step 4: Run the Project in Browser

Open your browser and go to:
http://localhost/auction_project/

Use the login credentials (provided or self-register) to explore roles:

Admin

Seller

Buyer/Bidder

📝 Notes

Ensure the database name in db.php matches the one you created in phpMyAdmin.

Adjust file permissions if running on Linux/Mac.

Keep your browser console open to check for errors if something isn’t working.
