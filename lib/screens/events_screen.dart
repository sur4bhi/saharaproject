import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<CommunityEvent> _events = [
    CommunityEvent(
      title: 'सुबह का योग सत्र',
      englishTitle: 'Morning Yoga Session',
      description: 'वरिष्ठ नागरिकों के लिए विशेष योग कक्षा',
      englishDescription: 'Special yoga class for senior citizens',
      organizer: 'स्वास्थ्य सेवा NGO',
      location: 'सेक्टर 12 पार्क',
      date: DateTime(2025, 9, 20),
      time: '7:00 AM - 8:30 AM',
      category: 'Health & Wellness',
      isRegistered: false,
      attendees: 25,
      maxAttendees: 30,
      imageUrl: null,
    ),
    CommunityEvent(
      title: 'गीता चर्चा सभा',
      englishTitle: 'Gita Discussion Assembly',
      description: 'श्रीमद्भगवद्गीता के श्लोकों की व्याख्या और चर्चा',
      englishDescription: 'Explanation and discussion of Bhagavad Gita verses',
      organizer: 'धार्मिक सेवा समिति',
      location: 'राम मंदिर हॉल',
      date: DateTime(2025, 9, 21),
      time: '5:00 PM - 6:30 PM',
      category: 'Spiritual',
      isRegistered: true,
      attendees: 45,
      maxAttendees: 50,
      imageUrl: null,
    ),
    CommunityEvent(
      title: 'फिजियोथेरेपी वर्कशॉप',
      englishTitle: 'Physiotherapy Workshop',
      description: 'घुटने और कमर के दर्द के लिए व्यायाम',
      englishDescription: 'Exercises for knee and back pain relief',
      organizer: 'हेल्थ केयर फाउंडेशन',
      location: 'कम्युनिटी सेंटर',
      date: DateTime(2025, 9, 22),
      time: '10:00 AM - 12:00 PM',
      category: 'Health & Wellness',
      isRegistered: false,
      attendees: 18,
      maxAttendees: 25,
      imageUrl: null,
    ),
    CommunityEvent(
      title: 'पुस्तक पठन क्लब',
      englishTitle: 'Book Reading Club',
      description: 'प्रेमचंद की कहानियों का पाठ और चर्चा',
      englishDescription: 'Reading and discussion of Premchand\'s stories',
      organizer: 'साहित्य प्रेमी संघ',
      location: 'सेंट्रल लाइब्रेरी',
      date: DateTime(2025, 9, 23),
      time: '3:00 PM - 4:30 PM',
      category: 'Literature',
      isRegistered: false,
      attendees: 12,
      maxAttendees: 20,
      imageUrl: null,
    ),
    CommunityEvent(
      title: 'मंदिर दर्शन यात्रा',
      englishTitle: 'Temple Visit Trip',
      description: 'इस्कॉन मंदिर दर्शन और सत्संग',
      englishDescription: 'ISKCON temple visit and satsang',
      organizer: 'यात्रा संगठन समिति',
      location: 'इस्कॉन मंदिर, वृंदावन',
      date: DateTime(2025, 9, 24),
      time: '6:00 AM - 8:00 PM',
      category: 'Spiritual',
      isRegistered: false,
      attendees: 35,
      maxAttendees: 40,
      imageUrl: null,
    ),
    CommunityEvent(
      title: 'बागवानी कार्यशाला',
      englishTitle: 'Gardening Workshop',
      description: 'घरेलू बागवानी और पौधों की देखभाल',
      englishDescription: 'Home gardening and plant care tips',
      organizer: 'गार्डन क्लब',
      location: 'बॉटनिकल गार्डन',
      date: DateTime(2025, 9, 25),
      time: '8:00 AM - 10:00 AM',
      category: 'Hobbies',
      isRegistered: false,
      attendees: 20,
      maxAttendees: 25,
      imageUrl: null,
    ),
  ];

  List<CommunityEvent> _filteredEvents = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredEvents = _events;
  }

  void _filterEvents(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredEvents = _events;
      } else {
        _filteredEvents = _events.where((event) => event.category == category).toList();
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
            Text('कार्यक्रम'),
            Text(
              'Events & Activities',
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
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'आगामी कार्यक्रम / Upcoming Events',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All', 'सभी'),
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
              itemCount: _filteredEvents.length,
              itemBuilder: (context, index) {
                final event = _filteredEvents[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 6,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: _getCategoryColor(event.category),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: _getCategoryColor(event.category).withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _getCategoryIcon(event.category),
                                    color: _getCategoryColor(event.category),
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.title,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        event.englishTitle,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: const Color(0xFFFFAB40),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (event.isRegistered)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'पंजीकृत',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              event.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event.englishDescription,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 8),
                                      Text(
                                        _formatDate(event.date),
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 8),
                                      Text(
                                        event.time,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          event.location,
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.business, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          event.organizer,
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: event.attendees / event.maxAttendees,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      _getCategoryColor(event.category),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '${event.attendees}/${event.maxAttendees}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'सदस्य / Members',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      _showEventDetails(context, event);
                                    },
                                    icon: const Icon(Icons.info, size: 18),
                                    label: const Text('विस्तार देखें'),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: Color(0xFFFF7043)),
                                      foregroundColor: const Color(0xFFFF7043),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: event.attendees < event.maxAttendees
                                        ? () {
                                            _registerForEvent(context, event);
                                          }
                                        : null,
                                    icon: Icon(
                                      event.isRegistered 
                                          ? Icons.check 
                                          : Icons.person_add,
                                      size: 18,
                                    ),
                                    label: Text(
                                      event.isRegistered 
                                          ? 'पंजीकृत' 
                                          : 'पंजीकरण करें',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
        onSelected: (selected) => _filterEvents(category),
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

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Health & Wellness':
        return Colors.green;
      case 'Spiritual':
        return Colors.purple;
      case 'Literature':
        return Colors.blue;
      case 'Hobbies':
        return Colors.orange;
      default:
        return const Color(0xFFFF7043);
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Health & Wellness':
        return Icons.spa;
      case 'Spiritual':
        return Icons.temple_hindu;
      case 'Literature':
        return Icons.menu_book;
      case 'Hobbies':
        return Icons.palette;
      default:
        return Icons.event;
    }
  }

  String _formatDate(DateTime date) {
    final days = ['रविवार', 'सोमवार', 'मंगलवार', 'बुधवार', 'गुरुवार', 'शुक्रवार', 'शनिवार'];
    final months = ['जनवरी', 'फरवरी', 'मार्च', 'अप्रैल', 'मई', 'जून', 'जुलाई', 'अगस्त', 'सितंबर', 'अक्टूबर', 'नवंबर', 'दिसंबर'];
    
    return '${days[date.weekday % 7]}, ${date.day} ${months[date.month - 1]}';
  }

  void _showEventDetails(BuildContext context, CommunityEvent event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(event.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.description),
            const SizedBox(height: 8),
            Text('आयोजक: ${event.organizer}'),
            Text('स्थान: ${event.location}'),
            Text('तारीख: ${_formatDate(event.date)}'),
            Text('समय: ${event.time}'),
            Text('सदस्य: ${event.attendees}/${event.maxAttendees}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('बंद करें'),
          ),
          if (!event.isRegistered && event.attendees < event.maxAttendees)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _registerForEvent(context, event);
              },
              child: const Text('पंजीकरण करें'),
            ),
        ],
      ),
    );
  }

  void _registerForEvent(BuildContext context, CommunityEvent event) {
    if (event.isRegistered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('आप पहले से इस कार्यक्रम में पंजीकृत हैं!'),
          backgroundColor: Color(0xFFFFAB40),
        ),
      );
      return;
    }

    setState(() {
      event.isRegistered = true;
      event.attendees++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${event.title} के लिए पंजीकरण सफल!'),
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

class CommunityEvent {
  final String title;
  final String englishTitle;
  final String description;
  final String englishDescription;
  final String organizer;
  final String location;
  final DateTime date;
  final String time;
  final String category;
  bool isRegistered;
  int attendees;
  final int maxAttendees;
  final String? imageUrl;

  CommunityEvent({
    required this.title,
    required this.englishTitle,
    required this.description,
    required this.englishDescription,
    required this.organizer,
    required this.location,
    required this.date,
    required this.time,
    required this.category,
    required this.isRegistered,
    required this.attendees,
    required this.maxAttendees,
    this.imageUrl,
  });
}