import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _voiceEnabled = true;
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'हिंदी';
  String _fontSize = 'बड़ा';

  final List<String> _languages = ['हिंदी', 'English', 'ગુજરાતી', 'मराठी', 'தமிழ்'];
  final List<String> _fontSizes = ['छोटा', 'मध्यम', 'बड़ा', 'बहुत बड़ा'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('प्रोफ़ाइल'),
            Text(
              'Profile',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFFFF7043).withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 48,
                        color: Color(0xFFFF7043),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'राम प्रकाश शर्मा',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Ram Prakash Sharma',
                            style: TextStyle(
                              color: Color(0xFFFFAB40),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'उम्र: 67 वर्ष • सेक्टर 15, गुड़गांव',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              _showEditProfileDialog(context);
                            },
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text('प्रोफ़ाइल संपादित करें'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Stats
            Text(
              'आपकी गतिविधि / Your Activity',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.group,
                            size: 32,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '3',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'समूह / Groups',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.event,
                            size: 32,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '7',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            'कार्यक्रम / Events',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.volunteer_activism,
                            size: 32,
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '2',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          Text(
                            'सहायक / Helpers',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Settings Section
            Text(
              'सेटिंग्स / Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Language Setting
            Card(
              child: ListTile(
                leading: const Icon(Icons.language, color: Color(0xFFFF7043)),
                title: const Text(
                  'भाषा / Language',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_selectedLanguage),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showLanguageSelector(context);
                },
              ),
            ),

            // Font Size Setting
            Card(
              child: ListTile(
                leading: const Icon(Icons.text_fields, color: Color(0xFFFF7043)),
                title: const Text(
                  'फ़ॉन्ट साइज़ / Font Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_fontSize),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showFontSizeSelector(context);
                },
              ),
            ),

            // Voice Commands Toggle
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.mic, color: Color(0xFFFF7043)),
                title: const Text(
                  'आवाज़ कमांड / Voice Commands',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('आवाज़ से ऐप को नियंत्रित करें'),
                value: _voiceEnabled,
                activeColor: const Color(0xFFFF7043),
                onChanged: (value) {
                  setState(() {
                    _voiceEnabled = value;
                  });
                },
              ),
            ),

            // Notifications Toggle
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.notifications, color: Color(0xFFFF7043)),
                title: const Text(
                  'सूचनाएं / Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('कार्यक्रमों की याद दिलाने के लिए'),
                value: _notificationsEnabled,
                activeColor: const Color(0xFFFF7043),
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 24),

            // Help & Support Section
            Text(
              'सहायता और सहयोग / Help & Support',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Card(
              child: ListTile(
                leading: const Icon(Icons.help_outline, color: Color(0xFFFF7043)),
                title: const Text(
                  'ऐप का उपयोग कैसे करें',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('How to use the app'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showHelpDialog(context);
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.contact_support, color: Color(0xFFFF7043)),
                title: const Text(
                  'संपर्क सहायता / Contact Support',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('समस्या की स्थिति में संपर्क करें'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showContactDialog(context);
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.feedback, color: Color(0xFFFF7043)),
                title: const Text(
                  'फीडबैक भेजें / Send Feedback',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('अपने सुझाव साझा करें'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showFeedbackDialog(context);
                },
              ),
            ),

            const SizedBox(height: 32),

            // Emergency Contact Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showEmergencyDialog(context);
                },
                icon: const Icon(Icons.local_hospital),
                label: const Text(
                  'आपातकालीन संपर्क / Emergency Contact',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('प्रोफ़ाइल संपादित करें'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'नाम / Name',
                hintText: 'अपना नाम दर्ज करें',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'उम्र / Age',
                hintText: 'अपनी उम्र दर्ज करें',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'पता / Address',
                hintText: 'अपना पता दर्ज करें',
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
                const SnackBar(
                  content: Text('प्रोफ़ाइल अपडेट हो गई!'),
                  backgroundColor: Color(0xFFFF7043),
                ),
              );
            },
            child: const Text('सेव करें'),
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('भाषा चुनें / Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _languages.map((language) {
            return RadioListTile<String>(
              title: Text(language),
              value: language,
              groupValue: _selectedLanguage,
              activeColor: const Color(0xFFFF7043),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('भाषा बदली गई: $value'),
                    backgroundColor: const Color(0xFFFF7043),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showFontSizeSelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('फ़ॉन्ट साइज़ चुनें'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _fontSizes.map((size) {
            return RadioListTile<String>(
              title: Text(size),
              value: size,
              groupValue: _fontSize,
              activeColor: const Color(0xFFFF7043),
              onChanged: (value) {
                setState(() {
                  _fontSize = value!;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('फ़ॉन्ट साइज़ बदला गया: $value'),
                    backgroundColor: const Color(0xFFFF7043),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ऐप का उपयोग'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('1. होम स्क्रीन पर विभिन्न सेवाओं को देखें'),
              SizedBox(height: 8),
              Text('2. समुदायिक समूह में शामिल हों'),
              SizedBox(height: 8),
              Text('3. कार्यक्रमों के लिए पंजीकरण करें'),
              SizedBox(height: 8),
              Text('4. स्वयंसेवकों से सहायता मांगें'),
              SizedBox(height: 8),
              Text('5. आवाज़ कमांड का उपयोग करें'),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('समझ गया'),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('संपर्क सहायता'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('सहायता हेल्पलाइन:'),
            SizedBox(height: 8),
            Text(
              '📞 1800-123-4567',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7043),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text('ईमेल सहायता:'),
            SizedBox(height: 8),
            Text(
              '✉️ support@sahara.app',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7043),
              ),
            ),
            SizedBox(height: 16),
            Text('समय: सुबह 9:00 से शाम 6:00 तक'),
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('कॉल की जा रही है...'),
                  backgroundColor: Color(0xFFFF7043),
                ),
              );
            },
            child: const Text('कॉल करें'),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('फीडबैक भेजें'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'आपका सुझाव',
                hintText: 'कृपया अपना फीडबैक लिखें...',
                border: OutlineInputBorder(),
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
                const SnackBar(
                  content: Text('आपका फीडबैक भेज दिया गया है। धन्यवाद!'),
                  backgroundColor: Color(0xFFFF7043),
                ),
              );
            },
            child: const Text('भेजें'),
          ),
        ],
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 8),
            Text('आपातकाल'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'क्या आपको तुरंत सहायता चाहिए?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('निम्नलिखित नंबरों पर कॉल करें:'),
            SizedBox(height: 12),
            Text('🚑 एम्बुलेंस: 102'),
            Text('🚓 पुलिस: 100'),
            Text('🚒 फायर: 101'),
            Text('📞 हेल्पलाइन: 1800-123-4567'),
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
                  content: Text('आपातकालीन सेवा को कॉल की जा रही है...'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('आपातकालीन कॉल'),
          ),
        ],
      ),
    );
  }
}