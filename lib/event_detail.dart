import 'package:flutter/material.dart';
import 'pendaftaran.dart'; // Import file pendaftaran.dart

final Color customBlue = Color(0xFF112C5A); // Define customBlue for all app

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage>
    with SingleTickerProviderStateMixin {//untuk mengontrol tab deskripsi dan pembelian tiket
  late TabController _tabController;
  late Map<String, String> event;

  @override
  void initState() {//menginisiasi tab yang berjumlah 2
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {//get data dari route
    super.didChangeDependencies();
    event = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  }

  @override
  void dispose() {//membersihkan tab ketika nonaktif
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//struktur halaman detail
      body: Column(//column untuk tata letak vertikal
        children: [
          // Image at the top
          Stack(
            children: [
              Image.asset(//menampilkan gambar event sesuai dengan tampilan luar
                event['image']!,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Positioned(//menempatkan tombol back diatas gambar
                top: 30.0,
                left: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: customBlue.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // TabBar below the image
          TabBar(//untuk menampilkan deskripsi dan beli tiket
            controller: _tabController,
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Deskripsi'),
              Tab(text: 'Beli Tiket'),
            ],
          ),
          // Event Name below the TabBar
          Container(//menampilkan nama event di bawah tab bar
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              event['name']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Default color for the text
              ),
            ),
          ),
          // TabBarView below the Event Name
          Expanded(//mengambil semua ruang dibawah nama event
            child: TabBarView(//menampilkan konten sesuai tab
              controller: _tabController,
              children: [
                _buildDescriptionTab(),
                _buildTicketTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {//mengatur konten tab deskripsi
    return SingleChildScrollView(//agar bisa di scroll
      child: Padding(//mengatur posisi dan desain deskripsi
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Default color for the text
              ),
            ),
            SizedBox(height: 10),
            Text(
              event['longDescription']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Default color for the text
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Syarat & Ketentuan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Default color for the text
              ),
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Mengisi formulir pendaftaran',
                  style: TextStyle(color: Colors.black), // Default color for the text
                ),
                Text(
                  '• Memberikan kontribusi sebesar ${event['price']}',
                  style: TextStyle(color: Colors.black), // Default color for the text
                ),
                Text(
                  '• Menjaga lingkungan sekitar',
                  style: TextStyle(color: Colors.black), // Default color for the text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketTab() {//mengatur tab beli tiket
    return SingleChildScrollView(//agar dapat di scroll
      child: Padding(//mengatur posisi dan desain tab beli tiket
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beli Tiket:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Harga: ${event['price']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(//untuk navigasi ke halaman pengisian formulir
                  onPressed: () {
                    // Redirect to registration page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(event: event),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.white), // Set icon color to white
                  label: Text(
                    'Beli Tiket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(customBlue), // Warna latar belakang tombol
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Atur sudut tombol
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}