import 'package:flutter/material.dart';


void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TROVE")),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String username = 'test';
                String password = 'test';
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage(),
                  ),
                );
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
//class for the discussion board


class DiscussionBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion Board'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text('Java Discussion Board'),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(_handleSearch),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Trove! '),
      ),
      drawer: Drawer(
        child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Your Name'),
                accountEmail: Text('your@email.com'),
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Home menu item tap
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => About_Us(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProfilePage(),
                    ),
                  );
                },
              ),
              ExpansionTile(
                leading: Icon(Icons.menu_book_sharp),
                title: Text('Courses'),
                children: <Widget>[
                  ExpansionTile(
                    title: Text('Java'),
                    children: <Widget>[
                      ListTile(
                        title: Text('Lessons'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Assignments'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Quizzes'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Articles'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Discussion Board'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DiscussionBoardPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),



                  ExpansionTile(
                    title: Text('Python'),
                    children: <Widget>[
                      ListTile(
                        title: Text('Lessons'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Assignments'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Quizzes'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Articles'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Discussion Board'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DiscussionBoardPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),


                  ExpansionTile(
                    title: Text('Cyber Securit'),
                    children: <Widget>[
                      ListTile(
                        title: Text('Lessons'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Assignments'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Quizzes'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Articles'),
                        onTap: () {
                          //
                        },
                      ),
                      ListTile(
                        title: Text('Discussion Board'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DiscussionBoardPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),


                ],
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Support System'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Support_System(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
                onTap: () {
                  _logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late  TextEditingController _passwordController;
  late  String _name;
  late  String _password;
  String _profileImage = 'assets/profile_image.png';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _name = 'John Doe';
    _password = '********';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _editProfile() {
    setState(() {
      _name = _nameController.text;
      _password = _passwordController.text;
    });
    Navigator.pop(context);
  }

  void _changeProfilePicture() {
    // changing profile picture
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding:
        EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_profileImage),
            ),
            SizedBox(height: 20),
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Password:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeProfilePicture,
        child: Icon(Icons.edit),
      ),
    );
  }
}
class About_Us extends StatelessWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("ABOUT-US | TROVE")),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "About Trove",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Trove is an educational application that provides courses, containing recorded lectures, articles, and short tests in the computer science field. you can view them anytime, anywhere.",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 65.0),
            Text(
              "Our Goals",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Enhancing people's technical skills and creating a future of achievers.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 65.0),
            Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Since distance learning has grown in importance in recent years, we have designed our application to be an interactive learning space environment that provides all ways of learning for students and we at Trove provide courses in the computer science field of study.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 65.0),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Trove@gmail.com",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Support_System extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Support System',
      home: SupportForm(),
    );
  }
}

class SupportForm extends StatefulWidget {
  @override
  _SupportFormState createState() => _SupportFormState();
}

class _SupportFormState extends State<SupportForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  String message = '';

  void handleSubmit() {
    setState(() {
      message =
      'Thank you, ${nameController.text} We will check the problem and contact you via email.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("SUPPORT SYSTEM | TROVE")),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Please fill out the form below and we will get back to you as soon as possible.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: '* Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: '* Email'),
            ),
            TextField(
              controller: problemController,
              decoration: InputDecoration(hintText: '* Problem'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: handleSubmit,
              icon: Icon(Icons.send),
              label: Text('Submit'),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple),
                  minimumSize: MaterialStateProperty.all(Size(350, 40))),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(fontSize: 16, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Function(String, BuildContext) onSearch;

  CustomSearchDelegate(this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "null");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return SearchResultWidget(query: query);
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

void _handleSearch(String query, BuildContext context) {
  String lowercaseQuery = query.toLowerCase();

  if (lowercaseQuery == 'java' ||
      lowercaseQuery == 'python' ||
      lowercaseQuery == 'cybersecurity') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(query: query),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Course not found for: $query'),
      ),
    );
  }
}



class SearchResultWidget extends StatelessWidget {
  final String query;

  SearchResultWidget({required this.query});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual search result rendering logic.
    return Container(
      child: Text('Search results for: $query'),
    );
  }
}
class SearchPage extends StatelessWidget {
  final String query;

  SearchPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Center(
        child: Text('Search results for: $query'),
      ),
    );
  }
}



class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // signin logic///

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
