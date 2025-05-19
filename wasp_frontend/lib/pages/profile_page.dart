import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTab = 0;
  int _selectedView = 0; // 0: grid, 1: list
  // Folders with notes
  final List<Map<String, dynamic>> _folders = [
    {
      'title': 'Veri Yapıları',
      'desc': 'Bağlı liste (Linked List), binary tree çizimleri',
      'notes': [
        {
          'title': 'Bağlı Liste Nedir?',
          'preview': 'Bağlı listeler veri yapılarında önemli bir yer tutar...',
          'date': '2024-06-01',
        },
        {
          'title': 'Binary Tree Çizimi',
          'preview': 'Binary tree yapısı ve örnek çizimler...',
          'date': '2024-06-02',
        },
      ],
    },
    {
      'title': 'Algoritma Analizi',
      'desc': 'Sorting algoritmalarının karşılaştırılması',
      'notes': [
        {
          'title': 'Bubble Sort vs Quick Sort',
          'preview': 'İki algoritmanın zaman karmaşıklığı ve örnek kodları...',
          'date': '2024-05-28',
        },
      ],
    },
    {
      'title': 'İşletim Sistemleri',
      'desc': 'FCFS vs Round Robin algoritmaları',
      'notes': [],
    },
    {
      'title': 'Mantıksal Mantık',
      'desc': 'Bileşik önerme, doğruluk tabloları',
      'notes': [
        {
          'title': 'Doğruluk Tablosu Nasıl Hazırlanır?',
          'preview': 'Adım adım doğruluk tablosu hazırlama...',
          'date': '2024-05-20',
        },
      ],
    },
    {
      'title': 'Database',
      'desc': 'SQL sorguları ve normalizasyon',
      'notes': [],
    },
    {
      'title': 'Bilgisayar Ağları',
      'desc': 'OSI modeli, TCP/IP protokolü',
      'notes': [
        {
          'title': 'OSI Modeli Katmanları',
          'preview': 'Her katmanın görevi ve örnekler...',
          'date': '2024-05-15',
        },
      ],
    },
  ];

  final List<Map<String, String>> _followers = [
    {
      'username': 'irem0x',
      'name': 'İrem Yılmaz',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg'
    },
    {
      'username': 'vedatcankoc',
      'name': 'Vedat Can',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg'
    },
    {
      'username': 'fatihdev',
      'name': 'Fatih Emiroğlu',
      'avatar': 'https://randomuser.me/api/portraits/men/4.jpg'
    },
    {
      'username': 'elifstudy',
      'name': 'Elif Kaya',
      'avatar': 'https://randomuser.me/api/portraits/women/5.jpg'
    },
  ];
  final List<Map<String, String>> _following = [
    {
      'username': 'busrastudy',
      'name': 'Büşra Yazar',
      'avatar': 'https://randomuser.me/api/portraits/women/1.jpg'
    },
    {
      'username': 'irem0x',
      'name': 'İrem Yılmaz',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg'
    },
    {
      'username': 'algomaster',
      'name': 'Ali G.',
      'avatar': 'https://randomuser.me/api/portraits/men/6.jpg'
    },
  ];

  void _openFollowers() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FollowersFollowingPage(
          title: 'Takipçi',
          users: _followers,
        ),
      ),
    );
  }

  void _openFollowing() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FollowersFollowingPage(
          title: 'Takip Edilen',
          users: _following,
        ),
      ),
    );
  }

  void _openNoteDetail(Map<String, dynamic> folder) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailPage(
          title: folder['title'],
          desc: folder['desc'],
          notes: folder['notes'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Avatar
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/1.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            // Username + verified
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'busrawrites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, color: Colors.orange, size: 18),
              ],
            ),
            const SizedBox(height: 4),
            // University/Department
            const Text(
              'İstanbul Kültür Üniversitesi\nBilgisayar Mühendisliği',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7C7C7C),
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 10),
            // Bio
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Büşra Yazar\nRenkli kalem ve Post-it Sevenler Kulübü Başkanı\n📝 Bullet journal queen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const _ProfileStat(count: '54', label: 'Not'),
                GestureDetector(
                  onTap: _openFollowers,
                  child: const _ProfileStat(count: '143', label: 'Takipçi'),
                ),
                GestureDetector(
                  onTap: _openFollowing,
                  child:
                      const _ProfileStat(count: '129', label: 'Takip Edilen'),
                ),
                const _ProfileStat(count: '58', label: 'Beğeni'),
              ],
            ),
            const SizedBox(height: 18),
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.sticky_note_2_rounded,
                        color: Colors.black, size: 28),
                    const SizedBox(height: 2),
                    Container(
                      width: 28,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.people_outline_rounded,
                    color: const Color(0xFFB7B7B7), size: 28),
                Icon(Icons.bookmark_border_rounded,
                    color: const Color(0xFFB7B7B7), size: 28),
              ],
            ),
            const SizedBox(height: 18),
            // Search bar with grid/list toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search_rounded,
                              color: Color(0xFFB7B7B7)),
                          const SizedBox(width: 6),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Notlarda Ara…',
                                border: InputBorder.none,
                                isCollapsed: true,
                                hintStyle: TextStyle(
                                    color: Color(0xFFB7B7B7),
                                    fontFamily: 'Lexend'),
                              ),
                              style: TextStyle(fontFamily: 'Lexend'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedView = 0;
                      });
                    },
                    child: Icon(Icons.grid_view_rounded,
                        color: _selectedView == 0
                            ? Colors.black
                            : const Color(0xFFB7B7B7),
                        size: 28),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedView = 1;
                      });
                    },
                    child: Icon(Icons.view_list_rounded,
                        color: _selectedView == 1
                            ? Colors.black
                            : const Color(0xFFB7B7B7),
                        size: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // Notes grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: _folders.length,
                itemBuilder: (context, index) {
                  final folder = _folders[index];
                  return GestureDetector(
                    onTap: () => _openNoteDetail(folder),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            folder['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            folder['desc'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF7C7C7C),
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String count;
  final String label;
  const _ProfileStat({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF7C7C7C),
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const _ProfileTab({required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            color: selected ? Colors.black : const Color(0xFFB7B7B7), size: 28),
        const SizedBox(height: 2),
        if (selected)
          Container(
            width: 24,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }
}

class FollowersFollowingPage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> users;
  const FollowersFollowingPage(
      {super.key, required this.title, required this.users});

  @override
  State<FollowersFollowingPage> createState() => _FollowersFollowingPageState();
}

class _FollowersFollowingPageState extends State<FollowersFollowingPage> {
  late List<bool> _isFollowing;

  @override
  void initState() {
    super.initState();
    // For demo: everyone is followed if the page is 'Takip Edilen', else not followed
    _isFollowing = List.generate(
        widget.users.length, (i) => widget.title == 'Takip Edilen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(widget.title,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold)),
      ),
      body: ListView.separated(
        itemCount: widget.users.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Color(0xFFF0F0F0)),
        itemBuilder: (context, index) {
          final user = widget.users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']!),
              radius: 24,
            ),
            title: Text(user['name']!,
                style: const TextStyle(
                    fontFamily: 'Lexend', fontWeight: FontWeight.bold)),
            subtitle: Text('@${user['username']}',
                style: const TextStyle(
                    fontFamily: 'Lexend', color: Color(0xFF7C7C7C))),
            trailing: _buildFollowButton(index),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          );
        },
      ),
    );
  }

  Widget _buildFollowButton(int index) {
    final following = _isFollowing[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFollowing[index] = !following;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: following ? Colors.white : Colors.black,
          border: Border.all(
              color: following ? const Color(0xFFB7B7B7) : Colors.black,
              width: 1.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          following ? 'Takiptesin' : 'Takip Et',
          style: TextStyle(
            color: following ? Colors.black : Colors.white,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class NoteDetailPage extends StatelessWidget {
  final String title;
  final String desc;
  final List notes;
  const NoteDetailPage(
      {super.key,
      required this.title,
      required this.desc,
      required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(desc,
                style: const TextStyle(
                    fontFamily: 'Lexend',
                    color: Color(0xFF7C7C7C),
                    fontSize: 15)),
            const SizedBox(height: 18),
            if (notes.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('This folder is empty.',
                      style: TextStyle(fontFamily: 'Lexend', fontSize: 18)),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(note['title'],
                            style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(note['preview'],
                            style: const TextStyle(fontFamily: 'Lexend')),
                        trailing: Text(note['date'],
                            style: const TextStyle(
                                fontFamily: 'Lexend',
                                color: Color(0xFFB7B7B7),
                                fontSize: 13)),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
