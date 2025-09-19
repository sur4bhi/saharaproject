import 'package:flutter/material.dart';

class NearbyGroupsScreen extends StatefulWidget {
  const NearbyGroupsScreen({super.key});

  @override
  State<NearbyGroupsScreen> createState() => _NearbyGroupsScreenState();
}

class _NearbyGroupsScreenState extends State<NearbyGroupsScreen> {
  final List<SocialGroup> _groups = [
    SocialGroup(
      name: 'प्रभात मिलन समूह',
      englishName: 'Morning Meet Group',
      description: 'सुबह की चाय और बातचीत के लिए दैनिक मिलन',
      englishDescription: 'Daily morning tea and conversation',
      location: 'सेक्टर 15 पार्क',
      englishLocation: 'Sector 15 Park',
      distance: '0.5 km',
      members: 12,
      time: 'सुबह 7:00 - 8:30',
      englishTime: '7:00 - 8:30 AM',
      language: 'हिंदी',
      category: 'Daily Social',
      isActive: true,
    ),
    SocialGroup(
      name: 'योग और ध्यान मंडल',
      englishName: 'Yoga & Meditation Circle',
      description: 'शारीरिक और मानसिक स्वास्थ्य के लिए योग',
      englishDescription: 'Yoga for physical and mental wellness',
      location: 'कम्युनिटी हॉल',
      englishLocation: 'Community Hall',
      distance: '1.2 km',
      members: 25,
      time: 'शाम 6:00 - 7:00',
      englishTime: '6:00 - 7:00 PM',
      language: 'हिंदी/English',
      category: 'Health & Wellness',
      isActive: true,
    ),
    SocialGroup(
      name: 'गीता पाठ समूह',
      englishName: 'Gita Reading Group',
      description: 'भगवद गीता की चर्चा और आध्यात्मिक बातें',
      englishDescription: 'Bhagavad Gita discussion and spiritual talks',
      location: 'श्री राम मंदिर',
      englishLocation: 'Shri Ram Temple',
      distance: '0.8 km',
      members: 18,
      time: 'रविवार शाम 5:00',
      englishTime: 'Sunday 5:00 PM',
      language: 'हिंदी',
      category: 'Spiritual',
      isActive: true,
    ),
    SocialGroup(
      name: 'बुक क्लब 55+',
      englishName: 'Book Club 55+',
      description: 'किताबों की चर्चा और कहानी साझाकरण',
      englishDescription: 'Book discussions and story sharing',
      location: 'लाइब्रेरी',
      englishLocation: 'Public Library',
      distance: '1.5 km',
      members: 15,
      time: 'शुक्रवार दोपहर 3:00',
      englishTime: 'Friday 3:00 PM',
      language: 'हिंदी/English',
      category: 'Literature',
      isActive: true,
    ),
    SocialGroup(
      name: 'गार्डनिंग क्लब',
      englishName: 'Gardening Club',
      description: 'बागवानी के शौकीनों के लिए समूह',
      englishDescription: 'Group for gardening enthusiasts',
      location: 'बॉटनिकल गार्डन',
      englishLocation: 'Botanical Garden',
      distance: '2.0 km',
      members: 22,
      time: 'शनिवार सुबह 8:00',
      englishTime: 'Saturday 8:00 AM',
      language: 'हिंदी/English',
      category: 'Hobbies',
      isActive: false,
    ),
  ];

  List<SocialGroup> _filteredGroups = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredGroups = _groups;
  }

  void _filterGroups(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredGroups = _groups;
      } else {
        _filteredGroups = _groups.where((group) => group.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('समुदायिक समूह'),
            Text(
              'Nearby Groups',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'श्रेणी चुनें / Select Category',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All', 'सभी'),
                      _buildCategoryChip('Daily Social', 'दैनिक मिलन'),
                      _buildCategoryChip('Health & Wellness', 'स्वास्थ्य'),
                      _buildCategoryChip('Spiritual', 'आध्यात्मिक'),
                      _buildCategoryChip('Literature', 'साहित्य'),
                      _buildCategoryChip('Hobbies', 'रुचियां'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredGroups.length,
              itemBuilder: (context, index) {
                final group = _filteredGroups[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: group.isActive 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.grey.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _getCategoryIcon(group.category),
                                color: group.isActive ? Colors.green : Colors.grey,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    group.name,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    group.englishName,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFFFFAB40),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: group.isActive 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                group.isActive ? 'सक्रिय' : 'निष्क्रिय',
                                style: TextStyle(
                                  color: group.isActive ? Colors.green : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          group.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          group.englishDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              '${group.location} (${group.distance})',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              group.time,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.group, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              '${group.members} सदस्य',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.language, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              group.language,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: group.isActive ? () {
                                  _showGroupDetails(context, group);
                                } : null,
                                icon: const Icon(Icons.info, size: 18),
                                label: const Text('विवरण देखें'),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFFFF7043)),
                                  foregroundColor: const Color(0xFFFF7043),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: group.isActive ? () {
                                  _joinGroup(context, group);
                                } : null,
                                icon: const Icon(Icons.group_add, size: 18),
                                label: const Text('जुड़ें'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category, String hindiName) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text('$hindiName\n$category'),
        selected: isSelected,
        onSelected: (selected) => _filterGroups(category),
        backgroundColor: Colors.grey[100],
        selectedColor: const Color(0xFFFF7043).withOpacity(0.2),
        labelStyle: TextStyle(
          color: isSelected ? const Color(0xFFFF7043) : Colors.black87,
          fontSize: 12,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Daily Social':
        return Icons.coffee;
      case 'Health & Wellness':
        return Icons.spa;
      case 'Spiritual':
        return Icons.temple_hindu;
      case 'Literature':
        return Icons.menu_book;
      case 'Hobbies':
        return Icons.palette;
      default:
        return Icons.group;
    }
  }

  void _showGroupDetails(BuildContext context, SocialGroup group) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(group.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(group.description),
            const SizedBox(height: 8),
            Text('स्थान: ${group.location}'),
            Text('समय: ${group.time}'),
            Text('भाषा: ${group.language}'),
            Text('सदस्य: ${group.members}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('बंद करें'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _joinGroup(context, group);
            },
            child: const Text('जुड़ें'),
          ),
        ],
      ),
    );
  }

  void _joinGroup(BuildContext context, SocialGroup group) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${group.name} में शामिल होने का अनुरोध भेजा गया!'),
        backgroundColor: const Color(0xFFFF7043),
        action: SnackBarAction(
          label: 'ठीक है',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}

class SocialGroup {
  final String name;
  final String englishName;
  final String description;
  final String englishDescription;
  final String location;
  final String englishLocation;
  final String distance;
  final int members;
  final String time;
  final String englishTime;
  final String language;
  final String category;
  final bool isActive;

  SocialGroup({
    required this.name,
    required this.englishName,
    required this.description,
    required this.englishDescription,
    required this.location,
    required this.englishLocation,
    required this.distance,
    required this.members,
    required this.time,
    required this.englishTime,
    required this.language,
    required this.category,
    required this.isActive,
  });
}