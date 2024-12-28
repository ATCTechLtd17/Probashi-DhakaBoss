import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
    SliderCard({super.key});

  final List<CardItem> cardItems = [
    CardItem(
      title: 'BMET registration',
      content: 'Register into the databank to search and apply for jobs',
      icon: Icons.home,
      route: '/bmet-form',
      color: Colors.teal[300] ?? Colors.teal,
    ),
    CardItem(
      title: 'Search for jobs ',
      content: 'Find your desired job',
      icon: Icons.home,
      route: '/search-job',
      color: Colors.teal[300] ?? Colors.teal,
    ),
    CardItem(
      title: 'Prededprature Orientation',
      content: 'Sign up for mandatory pre-deprature orientation',
      icon: Icons.home,
      route: '/pdo',
      color: Colors.teal[300] ?? Colors.teal,
    ),
    CardItem(
      title: 'BMET clearance ',
      content: 'Get BMET Clearance before Travelling Abroad',
      icon: Icons.home,
      route: '/bmet-clearance',
      color: Colors.teal[300] ?? Colors.teal,
    ),
    CardItem(
      title: 'Training Courses ',
      content: 'Choose specific training programs and get certified',
      icon: Icons.home,
      route: '/bmet-clearance',
      color: Colors.teal[300] ?? Colors.teal,
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cardItems.map((cardItem){
        return CardWidg(item: cardItem);
      }).toList()
     
    ),
     
    );
   
  }
}



class CardWidg extends StatelessWidget {
  final CardItem item;

 const  CardWidg({super.key, required this.item}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, item.route, arguments: item);
      },
      child: Expanded(
        
        child:Container(
          padding: EdgeInsets.only(right:12),
        
          child:Column(
          children: [
            Container(padding: EdgeInsets.all(12),
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(10),
              
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(item.icon,
                color: Colors.white,),
                Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(item.content, style: TextStyle(
                  color: Colors.white
                ),
                ),
              ],
            ),
            )
          ],
        ),
       
        
         ),
    
      ),
       );
  }

}

class CardItem {
  final String title;
  final String content;
  final IconData icon;
  final String route;
  final Color color;

  CardItem({required this.title, required this.content, required this.icon, required this.route, required this.color});
}


