import 'package:flutter/material.dart';

class HealthTipsPage extends StatefulWidget {
  @override
  _HealthTipsPageState createState() => _HealthTipsPageState();
}

class _HealthTipsPageState extends State<HealthTipsPage> {
  int _selectedIndex = 0;

  // List of titles for each tab
  final List<Map<String, dynamic>> _tips = [
    {
      'title': 'Home Remedies',
      'content': [
        {
          'title': 'Lemon Water',
          'description':
              'Start your day with a glass of warm lemon water to boost digestion and immunity. This remedy helps to detoxify the body by flushing out toxins, supports liver function, and provides a dose of vitamin C, which is crucial for immune system health. Lemon water also aids in digestion by stimulating the production of digestive juices and enzymes, promoting a healthier digestive tract and helping to prevent digestive issues like bloating and indigestion.',
          'image': 'lib/assets/lemon_water.jpg'
        },
        {
          'title': 'Honey Ginger Tea',
          'description':
              'Drinking honey ginger tea is a soothing remedy that combines the anti-inflammatory and antimicrobial properties of ginger with the soothing effects of honey. This tea can help alleviate throat irritation, reduce cough, and improve digestion. Ginger contains gingerol, a compound with strong antioxidant effects, while honey provides natural sweetness and has been used for centuries to ease coughs and sore throats. This combination also helps to boost the immune system and aid in digestion.',
          'image': 'lib/assets/honey_ginger_tea.jpg'
        },
        {
          'title': 'Turmeric Milk',
          'description':
              'Turmeric milk, also known as golden milk, is a traditional remedy that combines the anti-inflammatory properties of turmeric with the soothing effects of warm milk. Drinking turmeric milk before bed can help improve sleep quality, reduce inflammation, and support joint health. Turmeric contains curcumin, a potent antioxidant that helps to combat oxidative stress and inflammation in the body. This drink also promotes overall wellness and can aid in relaxation, making it a great addition to your nightly routine.',
          'image': 'lib/assets/turmeric_milk.jpg'
        },
      ],
    },
    {
      'title': 'Daily Exercises',
      'content': [
        {
          'title': 'Morning Stretch',
          'description':
              'Morning stretches are essential for warming up your muscles and preparing your body for the day ahead. Engaging in a full-body stretch routine can help improve flexibility, reduce muscle stiffness, and enhance overall circulation. Stretching in the morning helps to relieve tension built up during sleep, promote relaxation, and increase your range of motion. Incorporating dynamic stretches into your morning routine can also boost energy levels and improve mental focus for the day.',
          'image': 'lib/assets/morning_stretch.jpg'
        },
        {
          'title': 'Brisk Walking',
          'description':
              'Brisk walking is a simple yet effective exercise that can significantly benefit your cardiovascular health. Walking at a brisk pace for at least 30 minutes daily helps to strengthen the heart, improve circulation, and regulate blood pressure. It also aids in weight management by burning calories and increasing metabolism. Additionally, brisk walking can boost mood, enhance mental clarity, and provide a sense of accomplishment. It is a low-impact exercise suitable for all fitness levels and easy to incorporate into your daily routine.',
          'image': 'lib/assets/brisk_walking.jpg'
        },
        {
          'title': 'Yoga',
          'description':
              'Yoga is a holistic practice that combines physical postures, breathing techniques, and mindfulness to promote overall well-being. Incorporating yoga into your daily routine can improve flexibility, strength, and balance while reducing stress and enhancing mental clarity. Yoga poses and stretches help to release muscle tension, improve posture, and increase body awareness. Regular practice of yoga can also support emotional health by promoting relaxation, reducing anxiety, and fostering a sense of inner peace and balance.',
          'image': 'lib/assets/yoga.jpg'
        },
        {
          'title': 'Bodyweight Exercises',
          'description':
              'Bodyweight exercises are a convenient and effective way to build strength and improve fitness without the need for gym equipment. Exercises such as squats, push-ups, and planks use your own body weight as resistance to target multiple muscle groups. These exercises help to enhance muscle tone, increase endurance, and improve overall body strength. Incorporating bodyweight exercises into your fitness routine can lead to better muscle definition, improved functional fitness, and increased metabolic rate, supporting overall health and wellness.',
          'image': 'lib/assets/bodyweight_exercises.jpg'
        },
      ],
    },
    {
      'title': 'Health Tips',
      'content': [
        {
          'title': 'Balanced Diet',
          'description':
              'Maintaining a balanced diet is crucial for supporting overall health and well-being. A balanced diet includes a variety of foods from different food groups, such as fruits, vegetables, whole grains, lean proteins, and healthy fats. This approach ensures that you receive essential nutrients, vitamins, and minerals needed for optimal body function. Eating a balanced diet helps to manage weight, improve digestion, boost energy levels, and reduce the risk of chronic diseases like heart disease, diabetes, and cancer. Incorporate a diverse range of nutrient-rich foods to promote long-term health.',
          'image': 'lib/assets/balanced_diet.jpg'
        },
        {
          'title': 'Stay Hydrated',
          'description':
              'Staying hydrated is vital for maintaining overall health and supporting bodily functions. Drinking adequate amounts of water daily helps to regulate body temperature, support digestion, and facilitate nutrient absorption. Proper hydration also helps to flush out toxins, maintain healthy skin, and prevent dehydration-related issues like headaches, fatigue, and dizziness. Aim to drink at least 8 glasses of water a day, and increase intake during hot weather or physical activity. Infusing water with fruits or herbs can add flavor and enhance hydration.',
          'image': 'lib/assets/stay_hydrated.jpg'
        },
        {
          'title': 'Regular Check-ups',
          'description':
              'Scheduling regular medical check-ups is an important aspect of maintaining good health and preventing potential health issues. Regular visits to your healthcare provider allow for early detection of conditions and enable proactive management of existing health concerns. Check-ups typically include routine screenings, vaccinations, and assessments of vital health indicators such as blood pressure, cholesterol levels, and glucose levels. Early intervention and preventive care can help to mitigate risks, manage chronic conditions, and promote long-term wellness and quality of life.',
          'image': 'lib/assets/regular_checkups.jpg'
        },
      ],
    },
  ];

  // Track expanded state for each item
  final List<List<bool>> _expandedState = [
    [false, false, false], // Home Remedies
    [false, false, false, false], // Daily Exercises
    [false, false, false], // Health Tips
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleExpand(int index) {
    setState(() {
      _expandedState[_selectedIndex][index] =
          !_expandedState[_selectedIndex][index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tips[_selectedIndex]['title']),
      ),
      body: ListView.builder(
        itemCount: _tips[_selectedIndex]['content'].length,
        itemBuilder: (context, index) {
          final item = _tips[_selectedIndex]['content'][index];
          final isExpanded = _expandedState[_selectedIndex][index];
          return Column(
            children: [
              ListTile(
                title: Text(item['title']),
                leading: Image.asset(
                  item['image'],
                  width: 80, // Small version
                  height: 80,
                ),
                onTap: () => _toggleExpand(index),
              ),
              if (isExpanded)
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item['image'],
                          width: 300, // Large version
                          height: 300,
                        ),
                        SizedBox(height: 10),
                        Text(
                          item['title'],
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          item['description'],
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              Divider(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Home Remedies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Daily Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health Tips',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
