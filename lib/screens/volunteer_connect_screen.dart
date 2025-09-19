import 'package:flutter/material.dart';

class VolunteerConnectScreen extends StatefulWidget {
  const VolunteerConnectScreen({super.key});

  @override
  State<VolunteerConnectScreen> createState() => _VolunteerConnectScreenState();
}

class _VolunteerConnectScreenState extends State<VolunteerConnectScreen> {
  final List<Volunteer> _volunteers = [
    Volunteer(
      name: 'राज शर्मा',
      englishName: 'Raj Sharma',
      age: 28,
      skills: ['तकनीकी सहायता', 'दवाई लाना', 'खरीदारी'],
      englishSkills: ['Tech Support', 'Medicine Pickup', 'Shopping'],
      location: '2 km away',
      rating: 4.8,
      available: true,
      languages: ['हिंदी', 'English'],
      phoneNumber: '+91 98765 43210',
      profileImageUrl: null,
    ),
    Volunteer(
      name: 'प्रिया गुप्ता',
      englishName: 'Priya Gupta',
      age: 32,
      skills: ['पढ़ाना', 'फिजियोथेरेपी गाइड', 'बातचीत'],
      englishSkills: ['Teaching', 'Physio Guide', 'Companionship'],
      location: '1.5 km away',
      rating: 4.9,
      available: true,
      languages: ['हिंदी', 'English', 'पंजाबी'],
      phoneNumber: '+91 87654 32109',
      profileImageUrl: null,
    ),
    Volunteer(
      name: 'अमित पटेल',
      englishName: 'Amit Patel',
      age: 35,
      skills: ['ड्राइविंग', 'बैंक कार्य', 'डॉक्टर विजिट'],
      englishSkills: ['Driving', 'Banking', 'Doctor Visits'],
      location: '3 km away',
      rating: 4.7,
      available: false,
      languages: ['हिंदी', 'English', 'गुजराती'],
      phoneNumber: '+91 76543 21098',
      profileImageUrl: null,
    ),
    Volunteer(
      name: 'सुनीता देवी',
      englishName: 'Sunita Devi',
      age: 45,
      skills: ['खाना बनाना', 'सफाई', 'देखभाल'],
      englishSkills: ['Cooking', 'Cleaning', 'Care Support'],
      location: '1 km away',
      rating: 4.6,
      available: true,
      languages: ['हिंदी'],
      phoneNumber: '+91 65432 10987',
      profileImageUrl: null,
    ),
  ];

  List<String> _helpCategories = [
    'सभी / All',
    'तकनीकी सहायता / Tech Support',
    'घरेलू कार्य / Household',
    'स्वास्थ्य सेवा / Healthcare',
    'परिवहन / Transportation',
    'खरीदारी / Shopping',
    'साथी / Companionship',
  ];

  String _selectedCategory = 'सभी / All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('स्वयंसेवक संपर्क'),
            Text(
              'Volunteer Connect',
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
                Card(
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volunteer_activism,
                          size: 40,
                          color: Colors.blue.shade700,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'सहायता मांगें',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Ask for Help',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'विश्वसनीय स्वयंसेवकों से जुड़ें',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'सहायता का प्रकार / Type of Help',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _helpCategories.map((category) {
                      final isSelected = _selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          backgroundColor: Colors.grey[100],
                          selectedColor: const Color(0xFFFF7043).withOpacity(0.2),
                          labelStyle: TextStyle(
                            color: isSelected ? const Color(0xFFFF7043) : Colors.black87,
                            fontSize: 12,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _volunteers.length,
              itemBuilder: (context, index) {
                final volunteer = _volunteers[index];
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
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xFFFF7043).withOpacity(0.1),
                              child: Text(
                                volunteer.name.substring(0, 1),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF7043),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        volunteer.name,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: volunteer.available 
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          volunteer.available ? 'उपलब्ध' : 'व्यस्त',
                                          style: TextStyle(
                                            color: volunteer.available ? Colors.green : Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    volunteer.englishName,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFFFFAB40),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 16, color: Colors.amber[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${volunteer.rating}',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        volunteer.location,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'सेवाएं / Services:',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: volunteer.skills.map((skill) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                skill,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.language, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 8),
                            Text(
                              'भाषाएं: ${volunteer.languages.join(', ')}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  _showVolunteerProfile(context, volunteer);
                                },
                                icon: const Icon(Icons.person, size: 18),
                                label: const Text('प्रोफ़ाइल देखें'),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFFFF7043)),
                                  foregroundColor: const Color(0xFFFF7043),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: volunteer.available ? () {
                                  _connectWithVolunteer(context, volunteer);
                                } : null,
                                icon: const Icon(Icons.phone, size: 18),
                                label: const Text('संपर्क करें'),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showHelpRequestDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('सहायता मांगें'),
        backgroundColor: const Color(0xFFFFAB40),
      ),
    );
  }

  void _showVolunteerProfile(BuildContext context, Volunteer volunteer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(volunteer.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('उम्र: ${volunteer.age} वर्ष'),
            const SizedBox(height: 8),
            Text('रेटिंग: ${volunteer.rating}/5'),
            const SizedBox(height: 8),
            Text('स्थान: ${volunteer.location}'),
            const SizedBox(height: 8),
            Text('भाषाएं: ${volunteer.languages.join(', ')}'),
            const SizedBox(height: 8),
            const Text('सेवाएं:'),
            ...volunteer.skills.map((skill) => Text('• $skill')).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('बंद करें'),
          ),
          if (volunteer.available)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _connectWithVolunteer(context, volunteer);
              },
              child: const Text('संपर्क करें'),
            ),
        ],
      ),
    );
  }

  void _connectWithVolunteer(BuildContext context, Volunteer volunteer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('संपर्क करें'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${volunteer.name} से संपर्क करें:'),
            const SizedBox(height: 16),
            Text(
              volunteer.phoneNumber,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7043),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('रद्द करें'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${volunteer.name} को कॉल की जा रही है...'),
                  backgroundColor: const Color(0xFFFF7043),
                ),
              );
            },
            child: const Text('कॉल करें'),
          ),
        ],
      ),
    );
  }

  void _showHelpRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('सहायता का अनुरोध'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('आपको किस प्रकार की सहायता चाहिए?'),
            SizedBox(height: 16),
            Text('कृपया फोन पर बताएं या यहाँ टाइप करें।'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('रद्द करें'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('आपका अनुरोध भेजा गया है! जल्दी ही कोई स्वयंसेवक संपर्क करेगा।'),
                  backgroundColor: Color(0xFFFF7043),
                ),
              );
            },
            child: const Text('अनुरोध भेजें'),
          ),
        ],
      ),
    );
  }
}

class Volunteer {
  final String name;
  final String englishName;
  final int age;
  final List<String> skills;
  final List<String> englishSkills;
  final String location;
  final double rating;
  final bool available;
  final List<String> languages;
  final String phoneNumber;
  final String? profileImageUrl;

  Volunteer({
    required this.name,
    required this.englishName,
    required this.age,
    required this.skills,
    required this.englishSkills,
    required this.location,
    required this.rating,
    required this.available,
    required this.languages,
    required this.phoneNumber,
    this.profileImageUrl,
  });
}