import 'package:flutter/material.dart';
import 'nearby_groups_screen.dart';
import 'events_screen.dart';
import 'volunteer_connect_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeMenuItem> _menuItems = [
    HomeMenuItem(
      title: 'समुदायिक समूह',
      subtitle: 'Nearby Groups',
      description: 'अपने आस-पास के सामाजिक समूह खोजें',
      englishDescription: 'Find social groups near you',
      icon: Icons.group,
      color: Colors.blue,
      route: '/nearby-groups',
    ),
    HomeMenuItem(
      title: 'कार्यक्रम',
      subtitle: 'Events & Activities',
      description: 'आज के कार्यक्रम और गतिविधियां',
      englishDescription: 'Today\'s events and activities',
      icon: Icons.event,
      color: Colors.green,
      route: '/events',
    ),
    HomeMenuItem(
      title: 'स्वयंसेवक संपर्क',
      subtitle: 'Volunteer Connect',
      description: 'सहायता के लिए स्वयंसेवक से मिलें',
      englishDescription: 'Connect with volunteers for help',
      icon: Icons.volunteer_activism,
      color: Colors.purple,
      route: '/volunteer-connect',
    ),
    HomeMenuItem(
      title: 'स्वास्थ्य सुझाव',
      subtitle: 'Health Tips',
      description: 'फिजियोथेरेपी और स्वास्थ्य सुझाव',
      englishDescription: 'Physiotherapy and health guidance',
      icon: Icons.health_and_safety,
      color: Colors.orange,
      route: '/health-tips',
    ),
    HomeMenuItem(
      title: 'आध्यात्मिक पाठ',
      subtitle: 'Spiritual Reading',
      description: 'भगवद गीता और धार्मिक चर्चा',
      englishDescription: 'Bhagavad Gita and spiritual discussions',
      icon: Icons.menu_book,
      color: Colors.amber,
      route: '/spiritual-reading',
    ),
    HomeMenuItem(
      title: 'रुचियां',
      subtitle: 'Hobbies & Interests',
      description: 'कला, संगीत, बागवानी और अधिक',
      englishDescription: 'Art, music, gardening and more',
      icon: Icons.palette,
      color: Colors.pink,
      route: '/hobbies',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sahara - साहारा'),
            Text(
              'Your Community Companion',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: const Icon(Icons.person, size: 28),
            tooltip: 'Profile / प्रोफ़ाइल',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFFFF7043).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.waving_hand,
                      size: 40,
                      color: Color(0xFFFF7043),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'नमस्कार! आज कैसे हैं आप?',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Hello! How are you today?',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFFFFAB40),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'आज आपके लिए 3 नए कार्यक्रम उपलब्ध हैं',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'सेवाएं / Services',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                return Card(
                  elevation: 6,
                  child: InkWell(
                    onTap: () {
                      _navigateToScreen(context, item.route);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: item.color.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              size: 32,
                              color: item.color,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFFFFAB40),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.mic,
                      size: 48,
                      color: Colors.blue.shade700,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'आवाज़ से बात करें',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Voice Command Available',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '"मुझे आस-पास के समूह दिखाएं" कहें',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement voice command
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Voice command feature will be available soon'),
                            backgroundColor: Color(0xFFFF7043),
                          ),
                        );
                      },
                      icon: const Icon(Icons.mic),
                      label: const Text('बोलें / Speak'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Quick access to emergency contact or help
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('सहायता / Help'),
              content: const Text(
                'क्या आपको तुरंत सहायता चाहिए?\nDo you need immediate help?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('रद्द करें / Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Implement emergency contact
                  },
                  child: const Text('सहायता कॉल / Help Call'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.help),
        label: const Text('सहायता'),
        backgroundColor: const Color(0xFFFFAB40),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String route) {
    Widget screen;
    switch (route) {
      case '/nearby-groups':
        screen = const NearbyGroupsScreen();
        break;
      case '/events':
        screen = const EventsScreen();
        break;
      case '/volunteer-connect':
        screen = const VolunteerConnectScreen();
        break;
      default:
        screen = const Scaffold(
          body: Center(
            child: Text(
              'Coming Soon\nजल्द आ रहा है',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class HomeMenuItem {
  final String title;
  final String subtitle;
  final String description;
  final String englishDescription;
  final IconData icon;
  final Color color;
  final String route;

  HomeMenuItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.englishDescription,
    required this.icon,
    required this.color,
    required this.route,
  });
}