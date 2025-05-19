import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasp_frontend/config/app_config.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import 'package:wasp_frontend/pages/signup_page.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasp_frontend/pages/profile_page.dart';

import 'analyze_document.dart';
import 'create_video.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _feedData = [
    {
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'username': 'vedatcankoc',
      'university': 'İstanbul Kültür Üniversitesi',
      'verified': true,
      'time': '12 dk',
      'title': 'Lineer Cebir Ders Notları',
      'text':
          'İşte Lineer Cebir finaline çalışırken çıkardığım notlarımı! Determinantı anlattığın için teşekkürler @irem0x!',
      'image': 'assets/notes_sample.png',
      'likeCount': 21,
      'commentCount': 0,
      'liked': true,
      'saved': false,
    },
    {
      'avatar': 'https://randomuser.me/api/portraits/men/2.jpg',
      'username': 'fatihemirozdmr',
      'university': 'İstanbul Aydın Üniversitesi',
      'verified': true,
      'time': '25 dk',
      'title': 'Sayısal Yöntemler Ders Notları',
      'text':
          'Gauss-Seidel yönteminin neden bu kadar hızlı çözdüğünü şimdi anladım. Sistem denklemin çözülmek isteyenlere tavsiye edilir 😊',
      'image': 'assets/notes_sample.png',
      'likeCount': 0,
      'commentCount': 0,
      'liked': false,
      'saved': false,
    },
  ];

  void _onLike(int index) {
    setState(() {
      if (_feedData[index]['liked']) {
        _feedData[index]['liked'] = false;
        _feedData[index]['likeCount']--;
      } else {
        _feedData[index]['liked'] = true;
        _feedData[index]['likeCount']++;
      }
    });
  }

  void _onSave(int index) {
    setState(() {
      _feedData[index]['saved'] = !_feedData[index]['saved'];
    });
  }

  void _onComment(int index) {
    // You can implement navigation to a comment page or show a dialog
    // For now, just print
    print('Comment tapped on post $index');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // Home
      ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        itemCount: _feedData.length,
        itemBuilder: (context, index) {
          final post = _feedData[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: _FeedCard(
              post: post,
              onLike: () => _onLike(index),
              onSave: () => _onSave(index),
              onComment: () => _onComment(index),
            ),
          );
        },
      ),
      // Search (placeholder)
      Center(child: Text('Search', style: TextStyle(fontFamily: 'Lexend'))),
      // Add (placeholder)
      Center(child: Text('Add', style: TextStyle(fontFamily: 'Lexend'))),
      // Activity (placeholder)
      Center(child: Text('Activity', style: TextStyle(fontFamily: 'Lexend'))),
      // Profile
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'WASP',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded,
                color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFB7B7B7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onComment;
  const _FeedCard(
      {required this.post,
      required this.onLike,
      required this.onSave,
      required this.onComment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(post['avatar']),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post['username'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lexend',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          if (post['verified'])
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Icon(Icons.verified,
                                  color: Colors.blue, size: 18),
                            ),
                        ],
                      ),
                      Text(
                        post['university'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF7C7C7C),
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  post['time'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB7B7B7),
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Title
            Text(
              post['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            // Text
            _buildPostText(post['text']),
            const SizedBox(height: 8),
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                post['image'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 160,
              ),
            ),
            const SizedBox(height: 8),
            // Actions
            Row(
              children: [
                GestureDetector(
                  onTap: onLike,
                  child: Icon(Icons.thumb_up_alt_rounded,
                      color: post['liked'] ? Colors.blue : Color(0xFFB7B7B7),
                      size: 20),
                ),
                const SizedBox(width: 4),
                Text(
                  post['likeCount'].toString(),
                  style: TextStyle(
                    color:
                        post['liked'] ? Colors.blue : const Color(0xFFB7B7B7),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: onComment,
                  child: Icon(Icons.mode_comment_outlined,
                      color: Color(0xFFB7B7B7), size: 20),
                ),
                const SizedBox(width: 4),
                Text(
                  post['commentCount'].toString(),
                  style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onSave,
                  child: Icon(Icons.bookmark_border_rounded,
                      color: post['saved'] ? Colors.blue : Color(0xFFB7B7B7),
                      size: 22),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostText(String text) {
    final mentionRegex = RegExp(r'@\w+');
    final matches = mentionRegex.allMatches(text);
    if (matches.isEmpty) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: 'Lexend',
        ),
      );
    }
    final spans = <TextSpan>[];
    int last = 0;
    for (final match in matches) {
      if (match.start > last) {
        spans.add(TextSpan(
          text: text.substring(last, match.start),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: 'Lexend',
          ),
        ));
      }
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w600,
        ),
      ));
      last = match.end;
    }
    if (last < text.length) {
      spans.add(TextSpan(
        text: text.substring(last),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: 'Lexend',
        ),
      ));
    }
    return RichText(text: TextSpan(children: spans));
  }
}
