import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({super.key, required this.userData});

  Widget buildInfoItem(String label, dynamic value) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value?.toString() ?? "Không có dữ liệu"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${userData["firstName"]} ${userData["lastName"]}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar user
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(userData["image"]),
            ),
            const SizedBox(height: 15),

            // FULL NAME
            Text(
              "${userData["firstName"]} ${userData["lastName"]}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            // Username (nickname)
            Text(
              "@${userData["username"]}",
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 20),

            // GENERAL INFO
            Card(
              elevation: 4,
              child: Column(
                children: [
                  buildInfoItem("Email", userData["email"]),
                  buildInfoItem("Gender", userData["gender"]),
                  buildInfoItem("Age", userData["age"]),
                  buildInfoItem("Phone", userData["phone"]),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ADDRESS
            if (userData["address"] != null) ...[
              const Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Street", userData["address"]["address"]),
                    buildInfoItem("City", userData["address"]["city"]),
                    buildInfoItem("State", userData["address"]["state"]),
                    buildInfoItem("Postal Code", userData["address"]["postalCode"]),
                    buildInfoItem("Country", userData["address"]["country"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // COMPANY
            if (userData["company"] != null) ...[
              const Text("Company", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Name", userData["company"]["name"]),
                    buildInfoItem("Title", userData["company"]["title"]),
                    buildInfoItem("Department", userData["company"]["department"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // BANK INFO
            if (userData["bank"] != null) ...[
              const Text("Bank Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Card Number", userData["bank"]["cardNumber"]),
                    buildInfoItem("Card Type", userData["bank"]["cardType"]),
                    buildInfoItem("Currency", userData["bank"]["currency"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // CRYPTO
            if (userData["crypto"] != null) ...[
              const Text("Crypto Wallet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Coin", userData["crypto"]["coin"]),
                    buildInfoItem("Wallet Address", userData["crypto"]["wallet"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
