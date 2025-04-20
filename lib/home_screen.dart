// import 'package:flutter/material.dart';
// import 'main.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My task budy', style: TextStyle(color: Colors.tealAccent)),
//         backgroundColor: Colors.grey,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.grey),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.blue,
//                     child: Icon(Icons.person, color: Colors.white, size: 40),
//                   ),
//                   // SizedBox(height: 10),
//                   Text(
//                     'username',
//                     style: TextStyle(color: Colors.black, fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'email',
//                     style: TextStyle(color: Colors.black, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.dashboard),
//               title: Text('dashboard'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('profile'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('settings'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('home'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text('history'),
//               onTap: () {},
//             ),

//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('logout'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.grey,
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.add),
//                       tooltip: 'add tasks',
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Add tasks',
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.grey,
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.search),
//                       tooltip: 'search tasks',
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Search tasks',
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.grey,
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.delete),
//                       tooltip: 'Delete tasks',
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Delete tasks',
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Divider(),
//           ListTile(title: Text('Samsung notes')),
//           Divider(),
//           ListTile(title: Text('Biology notes')),
//           Divider(),
//           ListTile(title: Text('Aided Design Distribution notes')),
//           Divider(),
//           ListTile(title: Text('Elaborated Dev notes')),
//         ],
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Notes'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.settings),
//       //       label: 'Settings',
//       //     ),
//       //   ],
//       //   currentIndex: 0,
//       //   selectedItemColor: Colors.teal,
//       //   onTap: (index) {},
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'main.dart';
import 'profile.dart';
import 'settings.dart';

// The main HomeScreen widget, which is a StatefulWidget to manage dynamic state
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// The state class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tasks = []; // List to store tasks
  final TextEditingController _taskController =
      TextEditingController(); // Controller for the task input field

  // Function to add a task to the list
  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      // Check if the input is not empty
      setState(() {
        _tasks.add(_taskController.text); // Add the task to the list
      });
      _taskController.clear(); // Clear the input field
      Navigator.of(context).pop(); // Close the dialog
    }
  }

  // Function to delete a task from the list by index
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index); // Remove the task at the specified index
    });
  }

  // Function to search for tasks containing a specific query
  void _searchTask(String query) {
    showDialog(
      context: context,
      builder: (context) {
        // Filter tasks that contain the query
        final results = _tasks.where((task) => task.contains(query)).toList();
        return AlertDialog(
          title: Text('Search Results'), // Title of the dialog
          content:
              results.isEmpty
                  ? Text('No tasks found.') // Show message if no tasks match
                  : Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        results
                            .map((task) => Text(task))
                            .toList(), // Display matching tasks
                  ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My task budy',
          style: TextStyle(color: Colors.tealAccent),
        ), // App bar title
        backgroundColor: Colors.grey, // App bar background color
      ),
      drawer: Drawer(
        // Navigation drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // Header of the drawer
              decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    // User avatar
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  Text(
                    'username', // Placeholder for username
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'email', // Placeholder for email
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            // Drawer menu items
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('history'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add spacing at the top
          Row(
            // Row for task action buttons
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Space buttons evenly
            children: [
              // Add Task button
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Rounded button
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add), // Add icon
                      tooltip: 'add tasks', // Tooltip
                      onPressed: () {
                        // Show dialog to add a task
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text('Add Task'),
                                content: TextField(
                                  controller:
                                      _taskController, // Input field for task
                                  decoration: InputDecoration(
                                    hintText: 'Enter task',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () =>
                                            Navigator.of(
                                              context,
                                            ).pop(), // Close dialog
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: _addTask, // Add task
                                    child: Text('Add'),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Add tasks',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ), // Label
                ],
              ),
              // Search Task button
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Rounded button
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search), // Search icon
                      tooltip: 'search tasks', // Tooltip
                      onPressed: () {
                        // Show dialog to search tasks
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text('Search Task'),
                                content: TextField(
                                  onSubmitted:
                                      _searchTask, // Search task on submit
                                  decoration: InputDecoration(
                                    hintText: 'Enter task to search',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () =>
                                            Navigator.of(
                                              context,
                                            ).pop(), // Close dialog
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Search tasks',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ), // Label
                ],
              ),
              // Delete Task button
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Rounded button
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.delete), // Delete icon
                      tooltip: 'Delete tasks', // Tooltip
                      onPressed: () {
                        if (_tasks.isNotEmpty) {
                          // Check if there are tasks to delete
                          setState(() {
                            _tasks.removeLast(); // Remove the last task
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Delete tasks',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ), // Label
                ],
              ),
            ],
          ),
          Divider(), // Divider line
          Expanded(
            child: ListView.builder(
              // List of tasks
              itemCount: _tasks.length, // Number of tasks
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]), // Task name
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red), // Delete icon
                    onPressed: () => _deleteTask(index), // Delete task by index
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
