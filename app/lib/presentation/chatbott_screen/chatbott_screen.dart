// import 'package:flutter/material.dart';
// import 'package:meyaa/core/app_export.dart';
// import 'package:meyaa/widgets/app_bar/appbar_leading_image_one.dart';
// // import 'package:meyaa/widgets/app_bar/appbar_leading_image_two.dart';
// // import 'package:meyaa/widgets/app_bar/appbar_image.dart';
// // import 'package:meyaa/widgets/app_bar/appbar_subtitle_four.dart';
// import 'package:meyaa/widgets/app_bar/appbar_subtitle_three.dart';
// // import 'package:meyaa/widgets/app_bar/appbar_title_image.dart';
// import 'package:meyaa/widgets/app_bar/appbar_trailing_edittext.dart';
// // import 'package:meyaa/widgets/app_bar/appbar_subtitle_seven.dart';
// import 'package:meyaa/widgets/app_bar/appbar_trailing_image.dart';
// import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';
// import 'package:meyaa/widgets/custom_elevated_button.dart';
// import 'package:meyaa/widgets/custom_text_form_field.dart';
// import 'package:meyaa/theme/theme_helper.dart';
// import 'package:meyaa/responsive.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:http/io_client.dart'; // Import IOClient class
// import 'dart:io'; // Import X509Certificate class
// import 'package:meyaa/services/chat_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:math';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:map_launcher/map_launcher.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import '../access_message_screen/access_message_screen.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:uuid/uuid.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// // Replace with your actual OpenWeatherMap API key
// const String apiKey = '6424affbbd28f74fb00505763d0c2b75';

// Future<Map<String, dynamic>> fetchWeather(String cityName) async {
//   final url = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     // Decode JSON response
//     final data = json.decode(response.body);
//     return data;
//   } else {
//     // Handle API errors
//     print('Error fetching weather data: ${response.statusCode}');
//     throw Exception('Failed to load weather data');
//   }
// }

// // ignore_for_file: must_be_immutable
// class ChatbottScreen extends StatefulWidget {
//   ChatbottScreen({Key? key}) : super(key: key);
//   @override
//   State<ChatbottScreen> createState() => _ChatbottScreenState();
// }

// class _ChatbottScreenState extends State<ChatbottScreen> {
//   String? userId;
//   // bool isSearchButtonEnabled = false; // Initialize to false initially
//   final searchTextController = TextEditingController();
//   final imagePicker = ImagePicker();

//   Future<String?> saveImageToGallery(String imagePath) async {
//     final result = await GallerySaver.saveImage(imagePath);
//     // Check for null explicitly:
//     if (result != null && result) {
//       return imagePath;
//     } else {
//       return null;
//     }
//   }

//   List<ChatMessage> messages = []; // Add this line to declare the messages list
//   TextEditingController saveEditTextController = TextEditingController();
//   // RasaChatService rasaChatService = RasaChatService('http://10.0.2.2:5005');

//   // TextEditingController outlineFilesCopyEditTextController =
//   //     TextEditingController();
//   // Future<String> sendQuery(String query) async {
//   //   final httpClient = HttpClient();
//   //   httpClient.badCertificateCallback =
//   //       (X509Certificate cert, String host, int port) => true;

//   //   final ioClient = IOClient(httpClient);

//   //   final response = await ioClient.post(
//   //     Uri.parse(rasaChatService.getRasaServerUrl()),
//   //     headers: {'Content-Type': 'application/json'},
//   //     body: jsonEncode({'sender': 'user_id', 'message': query}),
//   //   );
//   //   print('Response Status Code: ${response.statusCode}');
//   //   print('Response Body: ${response.body}');

//   //   ioClient.close();

//   //   if (response.statusCode == 200) {
//   //     return response.body;
//   //   } else {
//   //     throw Exception('Failed to send query');
//   //   }
//   // }

//   // Future<String> sendMessage(String userId, String message) async {
//   //   try {
//   //     String botResponse = await rasaChatService.sendMessage(userId, message);
//   //     return botResponse;
//   //   } catch (e) {
//   //     throw Exception('Failed to send message');
//   //   }
//   // }

//   // void _handleBotResponse(String query) async {
//   //   // Authentication logic
//   //   String userId = await getUserId(); // Add 'await' here
//   //   try {
//   //     String response = await rasaChatService.sendMessage(userId, query);
//   //     // Update the UI with the bot's response

//   //     setState(() {
//   //       responseText = response;
//   //     });
//   //   } catch (e) {
//   //     print("Network error: $e");
//   //     // Handle the error, for example, show an error message to the user.
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Failed to get response. Please try again.'),
//   //         duration: Duration(seconds: 3),
//   //         // You can customize other properties of SnackBar as needed
//   //       ),
//   //     );
//   //   }
//   // }

//   Future<String> getUserId() async {
//     // Check if the user ID is already stored locally
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString('userId');

//     if (userId == null) {
//       // If not, generate and store a new one
//       userId = generateUserId();

//       // Store the generated user ID locally
//       prefs.setString('userId', userId);
//     }

//     return userId!;
//   }

// ///////////////////////////////////////////another way to generate user id
// // String generateUserId() {
// //   // Get current timestamp
// //   DateTime now = DateTime.now();
// //   int timestamp = now.microsecondsSinceEpoch;

// //   // Generate a random number
// //   int random = Random().nextInt(999999);

// //   // Combine timestamp and random number to create a unique ID
// //   String uniqueUserId = '$timestamp$random';

// //   return uniqueUserId;
// // }
//   ///second way to generate user id
//   String generateUserId() {
//     // Use the Uuid class to generate a UUID
//     Uuid uuid = Uuid();
//     String uniqueUserId = uuid.v4(); // Generates a version 4 (random) UUID

//     return uniqueUserId;
//   }

//   TextEditingController playEditTextController = TextEditingController();
//   String responseText = ''; // Add this line to declare responseText variable
//   var isDark = false;
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     // double screenWidth = mediaQueryData.size.width;
//     return SafeArea(
//         child: Scaffold(
//             extendBody: true,
//             extendBodyBehindAppBar: true,
//             resizeToAvoidBottomInset: false,
//             appBar: _buildAppBar(context),
//             body: Container(
//                 width: mediaQueryData.size.width,
//                 height: mediaQueryData.size.height,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment(0, 0),
//                         end: Alignment(-0.21, 0.08),
//                         colors: [
//                       appTheme.purple9003301,
//                       appTheme.purple90033,
//                       theme.colorScheme.secondaryContainer
//                     ])),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 70.h),
//                   child: Container(
//                       width: double.maxFinite,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 13.h, vertical: 7.v),
//                       child: Center(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Center(
//                                   child: Stack(
//                                       // Wrap the Stack with SingleChildScrollView
//                                       children: [
//                                         SizedBox(
//                                           height: 58.v,
//                                           width: 255.h,
//                                           child: SingleChildScrollView(
//                                             child: Center(
//                                               child: Stack(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 children: [
//                                                   Align(
//                                                     alignment: Alignment.center,
//                                                     child: Container(
//                                                       width: 700.h,
//                                                       height: 58.v,
//                                                       // width: screenWidth * 0.7,
//                                                       margin: EdgeInsets.only(
//                                                         right: 6.h,
//                                                       ),
//                                                       // padding: EdgeInsets.symmetric(
//                                                       //   horizontal: 14.h,
//                                                       //   vertical: 11.v,
//                                                       // ),
//                                                       decoration: AppDecoration
//                                                           .fillBlueGray
//                                                           .copyWith(
//                                                         borderRadius:
//                                                             BorderRadiusStyle
//                                                                 .roundedBorder12,
//                                                       ),
//                                                       child: Padding(
//                                                         padding: EdgeInsets
//                                                             .symmetric(
//                                                                 horizontal:
//                                                                     10.h),
//                                                         child: SwitchListTile(
//                                                           inactiveThumbColor:
//                                                               Color(0XFFA09E99),
//                                                           activeColor:
//                                                               Color(0XFFBC83E9),
//                                                           title: AutoSizeText(
//                                                             "Real Estate",
//                                                             maxLines: 1,
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             style: CustomTextStyles
//                                                                 .titleLargeInter
//                                                                 .copyWith(
//                                                               fontSize: 22.h,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               fontFamily:
//                                                                   'Inter',
//                                                             ),
//                                                           ),
//                                                           value:
//                                                               isDark, // Set the initial value based on your logic
//                                                           onChanged:
//                                                               (bool value) {
//                                                             // Add your logic when the switch is toggled
//                                                             setState(() {
//                                                               isDark = value;
//                                                             });
//                                                           },
//                                                           // Optional: Icon on the left side
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ]),
//                                 ),
//                               ),
//                               SizedBox(height: 10.v),
//                               Spacer(),
//                               Align(
//                                   alignment: Alignment.center,
//                                   child: Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 39.h, right: 31.h),
//                                       child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             // _buildSaveButton(context),
//                                             // _buildRefreshButton(context)
//                                           ]))),
//                               _buildPlayEditText(context),
//                               SizedBox(height: 12.v)
//                             ]),
//                       )),
//                 ))));
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       height: 105.v,
//       leadingWidth: 26.h,
//       leading: Padding(
//         padding: EdgeInsets.only(top: 23.h),
//         child: AppbarLeadingImageOne(
//             imagePath: ImageConstant.imgArrowLeft,
//             margin: EdgeInsets.only(left: 18.h, top: 5.v, bottom: 38.v), //38
//             onTap: () {
//               onTapArrowLeft(context);
//             }),
//       ),
//       title: Padding(
//         padding: EdgeInsets.only(top: 30.h),
//         child: AppbarSubtitleThree(
//           text: "Chatbott",
//           margin: EdgeInsets.only(left: 18.h, bottom: 40.v),
//         ),
//       ),
//     );
//   }

// // BuildChatHistorySction
//   Widget _buildChatHistory() {
//     return Container(
//       height: 480.v,
//       child: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.h),
//             child: Align(
//               alignment: messages[index].isUser
//                   ? Alignment.centerLeft
//                   : Alignment.centerRight,
//               child: Container(
//                 padding: EdgeInsets.all(10.h),
//                 decoration: BoxDecoration(
//                   color: messages[index].isUser ? Colors.blue : Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   messages[index].text,
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Widget _buildPlayEditText(BuildContext context) {
//   // return Column(
//   //   children: [
//   //     _buildChatHistory(), // Display chat history
//   //     Padding(
//   //       padding: EdgeInsets.only(left: 6.h, right: 3.h),
//   //       child: CustomTextFormField(
//   //         controller: playEditTextController,
//   //       ),
//   //     ),
//   //     SizedBox(height: 10.v),
//   //       ElevatedButton(
//   //         //sendmessagebutton
//   //         onPressed: () async {
//   //           String userQuery = playEditTextController.text;
//   //           print('Sending message: $userQuery');

//   //           try {
//   //             String botResponse =
//   //                 await sendMessage(userId ?? "defaultUserId", userQuery);
//   //             print('Bot Response: $botResponse');

//   //             setState(() {
//   //               messages.add(ChatMessage(text: userQuery, isUser: true));
//   //               messages.add(ChatMessage(text: botResponse, isUser: false));
//   //             });
//   //           } on Exception catch (e) {
//   //             ScaffoldMessenger.of(context).showSnackBar(
//   //               SnackBar(
//   //                 content: Text(e.toString()),
//   //                 duration: Duration(seconds: 3),
//   //               ),
//   //             );
//   //           }
//   //         },
//   //         child: Text('Send message'),
//   //       ),
//   //     ],
//   //   );
//   // }

//   // _launchGoogleNews() async {
//   //   _controller.loadUrl('https://news.google.com');
//   // }

//   Widget _buildPlayEditText(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.zero,
//       // Set padding to zero
//       child: Column(
//         children: [
//           _buildChatHistory(), // Display chat history
//           Padding(
//             padding: EdgeInsets.only(
//                 left: 3.h, right: 1.h), // Reduce padding slightly
//             child: CustomTextFormField(
//               controller: playEditTextController,
//             ),
//           ),
//           // SizedBox(height: 10.v),
//           // SizedBox(height: 5.v),
//           //forSearchOnInternet
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   String userQuery = playEditTextController.text.trim();
//                   if (userQuery.isNotEmpty) {
//                     print('Searching on Google: $userQuery');
//                     Uri url =
//                         Uri.parse('https://www.google.com/search?q=$userQuery');
//                     if (await canLaunchUrl(url)) {
//                       try {
//                         await launchUrl(url);
//                       } catch (error) {
//                         print('Error launching URL: $error');
//                       }
//                     } else {
//                       print('Could not launch Google search');
//                     }
//                   } else {
//                     print('Search query is empty.');
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Please enter a search query.'),
//                         duration: Duration(seconds: 3),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Search on Internet'),
//               ),
//               //forLocationOnMap
// ElevatedButton(
//   onPressed: () async {
//     String placeName = playEditTextController.text.trim();
//     if (placeName.isNotEmpty) {
//       print('Searching on Google: $placeName');
//       final Uri mapUrl = Uri.parse(
//           "https://www.google.com/maps/search/?api=1&query=$placeName");
//       if (await canLaunchUrl(mapUrl)) {
//         try {
//           await launchUrl(mapUrl);
//         } catch (error) {
//           print('Error launching Google Maps URL: $error');
//         }
//       } else {
//         print('Could not launch Google Maps');
//       }
//     } else {
//       print('Place name is empty.');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a place name.'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   },
//   child: Text('Location on Map'),
// ),
// //OpenCamera&takePhotos
// ElevatedButton(
//   onPressed: () async {
//     final pickedFile = await imagePicker.pickImage(
//       source:
//           ImageSource.camera, // Use ImageSource.camera for camera
//     );

//     if (pickedFile != null) {
//       final bytes = await File(pickedFile.path).readAsBytes();

//       try {
//         // 1. Request storage permission (if not already granted)
//         final storageStatus = await Permission.storage.request();

//         if (storageStatus == PermissionStatus.granted) {
//           // 2. Get the external storage directory
//           final appDirectory =
//               await getExternalStorageDirectory();

//           // 3. Create the Meyaa folder if it doesn't exist
//           final meyaaDirectory =
//               Directory('${appDirectory!.path}/Meyaa');
//           if (!await meyaaDirectory.exists()) {
//             await meyaaDirectory.create(recursive: true);
//           }

//           final fileName = DateTime.now().toString() +
//               '.jpg'; // Customize filename
//           final imageFile =
//               File('${meyaaDirectory.path}/$fileName');

//           // 4. Save the image to the Meyaa folder
//           await imageFile.writeAsBytes(bytes);

//           // 5. Add the image to the device's gallery
//           final savedImagePath =
//               await GallerySaver.saveImage(imageFile.path);

//           if (savedImagePath != null) {
//             print(
//                 'Image saved to Meyaa folder (external storage) and gallery: $savedImagePath');
//           } else {
//             print('Failed to save image to gallery.');
//           }
//         } else {
//           print('Storage permission denied.');
//           // Handle permission denial gracefully, e.g., display an error message
//         }
//       } catch (error) {
//         print('Error saving image: $error');
//         // Handle other errors gracefully
//       }
//     } else {
//       print('Image selection cancelled.');
//     }
//   },
//   child: Text('Open Camera'),
// ),
//             ],
//           ),
//           Row(
//             children: [
// //AccessPhotos
// ElevatedButton(
//   onPressed: () async {
//     final photosStatus = await Permission.photos.request();

//     if (photosStatus == PermissionStatus.granted) {
//       try {
//         // Use image_picker to directly open the device's photos
//         final pickedFile = await ImagePicker().pickImage(
//           source: ImageSource.gallery,
//         );

//         if (pickedFile != null) {
//           // Handle the selected image here
//           // (e.g., display it, process it, etc.)
//           print('Selected image path: ${pickedFile.path}');
//         } else {
//           print('Image selection cancelled.');
//         }
//       } catch (error) {
//         print('Error opening photos: $error');
//         // Handle error gracefully
//       }
//     } else {
//       print('Photos permission denied.');
//       // Handle permission denial gracefully, e.g., display an error message
//     }
//   },
//   child: Text('Open Photos'),
// ),
// //MusicPlayback
// ElevatedButton(
//   onPressed: () async {
//     String userQuery = playEditTextController.text.trim();
//     if (userQuery.isNotEmpty) {
//       print('Searching music: $userQuery');
//       _showMusicProviderSelection(context, userQuery);
//     } else {
//       print('Search query is empty.');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a music query.'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   },
//   child: Text('Music Playback'),
// ),
// //Weather
// ElevatedButton(
//   onPressed: () async {
//     String cityName = playEditTextController.text.trim();
//     if (cityName.isNotEmpty) {
//       try {
//         // Fetch weather data using the provided function
//         Map<String, dynamic> weatherData =
//             await fetchWeather(cityName);

//         // Update UI with weather information
//         updateUIWithWeather(weatherData);
//       } catch (e) {
//         print('Error fetching weather data: $e');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 'Failed to fetch weather data. Please try again.'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } else {
//       print('City name is empty.');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a city name.'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   },
//   child: Text('Weather'),
// ),
// //ReadingNews
// ElevatedButton(
//   onPressed: () async {
//     String newsQuery = playEditTextController.text.trim();
//     if (newsQuery.isNotEmpty) {
//       // Use a standard URL launcher to open Google News with the query
//       final url = Uri.parse(
//           'https://news.google.com/search?q=$newsQuery');
//       if (await canLaunchUrl(url)) {
//         await launchUrl(url);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Could not launch Google News.'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a news topic.'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   },
//   child: Text('News'),
// ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

// void updateUIWithWeather(Map<String, dynamic> weatherData) {
//   final double temperature = weatherData['main']['temp'] - 273.15;
//   final String formattedTemperature =
//       temperature.toStringAsFixed(1); // Limit to 1 decimal place
//   final String description = weatherData['weather'][0]['description'];
//   final String cityName = weatherData['name'];

//   final weatherMessage =
//       'Weather in $cityName:\nTemperature: $formattedTemperature°C\nDescription: $description';

//   // Add the weather message to the messages list
//   setState(() {
//     messages.add(ChatMessage(text: weatherMessage, isUser: false));
//   });

//   print('Weather in $cityName:');
//   print('  Temperature: $temperature°C');
//   print('  Description: $description');
// }

// void _showMusicProviderSelection(BuildContext context, String query) async {
//   bool _isYoutubeSelected = false; // Track selection state (optional)

//   showModalBottomSheet(
//     context: context,
//     builder: (context) => Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ListTile(
//           onTap: () async {
//             Navigator.pop(context);
//             final url = Uri.parse(
//                 'https://www.youtube.com/results?search_query=$query');
//             if (await canLaunchUrl(url)) {
//               await launchUrl(url);
//             } else {
//               print('Could not launch YouTube');
//             }
//           },
//           leading: InkWell(
//             onTap: () async {
//               setState(() => _isYoutubeSelected = true);
//               Navigator.pop(context);
//               final url = Uri.parse(
//                   'https://www.youtube.com/results?search_query=$query');
//               if (await canLaunchUrl(url)) {
//                 await launchUrl(url);
//               } else {
//                 print('Could not launch YouTube');
//               }
//             },
//             child: Image.asset(
//               'assets/images/icons8-youtube-48.png', // Path to your icon
//               width: 48.0, // Adjust width as needed
//               height: 48.0, // Adjust height as needed
//             ),
//           ),
//           title: Text('YouTube', style: TextStyle(color: Colors.grey)),
//         ),
//         ListTile(
//           onTap: () async {
//             Navigator.pop(context);
//             // Open Spotify app if possible, otherwise open website
//             final url = Uri.parse('spotify://search/$query');
//             if (await canLaunchUrl(url)) {
//               await launchUrl(url);
//             } else {
//               final webUrl =
//                   Uri.parse('https://open.spotify.com/search/$query');
//               if (await canLaunchUrl(webUrl)) {
//                 await launchUrl(webUrl);
//               } else {
//                 print('Could not launch Spotify');
//               }
//             }
//           },
//           leading: InkWell(
//             onTap: () async {
//               setState(() => _isYoutubeSelected =
//                   true); // Update for consistency (optional)
//               Navigator.pop(context);
//               final url = Uri.parse('spotify://search/$query');
//               if (await canLaunchUrl(url)) {
//                 await launchUrl(url);
//               } else {
//                 final webUrl =
//                     Uri.parse('https://open.spotify.com/search/$query');
//                 if (await canLaunchUrl(webUrl)) {
//                   await launchUrl(webUrl);
//                 } else {
//                   print('Could not launch Spotify');
//                 }
//               }
//             },
//             child: Image.asset(
//               'assets/images/icons8-spotify-48.png',
//               width: 48.0,
//               height: 48.0,
//             ),
//           ),
//           title: Text('Spotify', style: TextStyle(color: Colors.grey)),
//         ),
//         ListTile(
//           onTap: () async {
//             Navigator.pop(context);
//             final url = Uri.parse('https://soundcloud.com/search/$query');
//             if (await canLaunchUrl(url)) {
//               await launchUrl(url);
//             } else {
//               print('Could not launch SoundCloud');
//             }
//           },
//           leading: InkWell(
//             onTap: () async {
//               Navigator.pop(context);
//               final url = Uri.parse('https://soundcloud.com/search/$query');
//               if (await canLaunchUrl(url)) {
//                 await launchUrl(url);
//               } else {
//                 print('Could not launch SoundCloud');
//               }
//             },
//             child: Image.asset(
//               'assets/images/icons8-soundcloud-logo-48.png', // Path to your icon
//               width: 48.0, // Adjust width as needed
//               height: 48.0, // Adjust height as needed
//             ),
//           ),
//           title: Text('SoundCloud', style: TextStyle(color: Colors.grey)),
//         ),
//       ],
//     ),
//   );
// }

//   /// Navigates back to the previous screen.
//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
// }

// class ChatMessage {
//   final String text;
//   final bool isUser;

//   ChatMessage({required this.text, required this.isUser});
// }
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'Messages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'package:http/io_client.dart'; // Import IOClient class
import 'dart:io'; // Import X509Certificate class
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

//SpeechPermision
Future<void> requestSpeechPermission() async {
  final status = await Permission.speech.request();
  if (status != PermissionStatus.granted) {
    throw Exception('Speech recognition permission not granted');
  }
}

class ChatbottScreen extends StatefulWidget {
  ChatbottScreen({Key? key}) : super(key: key);

  @override
  State<ChatbottScreen> createState() => _ChatbottScreenState();
}

class _ChatbottScreenState extends State<ChatbottScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  late stt.SpeechToText _speech;
  late FlutterTts flutterTts;

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
    _speech = stt.SpeechToText();
    flutterTts = FlutterTts();
  }

  //Speach-to-text
  Future<void> startListening() async {
    if (!_speech.isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print('Speech status: $status');
        },
        onError: (error) {
          print('Speech error: $error');
        },
      );
      if (available) {
        _speech.listen(
          onResult: (result) {
            setState(() {
              _controller.text = result.recognizedWords;
            });
          },
        );
      } else {
        print('Speech recognition is not available');
      }
    }
  }

  //Text-to-speech
  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US'); // Set the language
    await flutterTts.setPitch(1); // Set the pitch (optional)
    await flutterTts.speak(text); // Speak the text
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.deepPurple,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                  )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            sendMessage(_controller.text);
                            _controller.clear();
                          },
                          icon: Icon(Icons.send)),
                      IconButton(
                        onPressed: startListening,
                        icon: Icon(Icons.mic),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
      return;
    }

    setState(() {
      addMessage(Message(text: DialogText(text: [text])), true);
    });
    // Speak the message
    // await speak(text);

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)));
    if (response.message == null) return;

    //Add chatbotresponsein the UI
    setState(() {
      addMessage(response.message!);
      print(response.message);
      // Speak the chatbot's response
      speak(response.message!.text!.text!.join(" "));
      // print(
      //     'User query from Dialogflow: ${response?.queryResult?.parameters?['userQuery'] ?? 'No user query found'}');
      // Define userQuery, Extract it from the response
      String? userQuery = response?.queryResult?.parameters?['userQuery'];
      print('User query from Dialogflow: $userQuery');
      if (userQuery != null) {
        print('User query from Dialogflow: $userQuery');
        performSearchOnWeb(userQuery);
      }
      // Define locationName, Extract it from the response
      String? locationName = response?.queryResult?.parameters?['locationName'];
      print('location Name from Dialogflow: $locationName');
      if (locationName != null && locationName.isNotEmpty) {
        print('location Name from Dialogflow: $locationName');
        searchLocationOnMap(locationName);
      }
      // Check response message for openCameraAndTakePhoto
      //DefineresponseMessages
      List<String>? responseMessages = response
          .message?.text?.text; // Access the text property of DialogText
      if (responseMessages != null &&
          responseMessages.contains("Sure, opening camera for you..")) {
        openCameraAndTakePhoto();
      }
      // Check response message for openPhotos
      responseMessages = response
          .message?.text?.text; // Access the text property of DialogText
      if (responseMessages != null &&
          responseMessages.contains("Sure, opening photos for you..")) {
        openPhotos();
      }
      // Define newsQuery, Extract it from the response
      String? newsQuery = response?.queryResult?.parameters?['newsQuery'];
      print('newsQuery from Dialogflow: $newsQuery');
      if (newsQuery != null && newsQuery.isNotEmpty) {
        print('newsQuery from Dialogflow: $newsQuery');
        readNews(newsQuery);
      }
      // Define MusicQuery, Extract it from the response
      String? MusicQuery = response?.queryResult?.parameters?['MusicQuery'];
      print('MusicQuery from Dialogflow: $MusicQuery');
      if (MusicQuery != null && MusicQuery.isNotEmpty) {
        print('MusicQuery from Dialogflow: $MusicQuery');
        playMusic(MusicQuery);
      }
      // Define cityName, Extract it from the response
      String? cityName = response?.queryResult?.parameters?['cityName'];
      print('cityName from Dialogflow: $cityName');
      if (cityName != null && cityName.isNotEmpty) {
        print('cityName from Dialogflow: $cityName');
        getWeather(cityName);
      }
    });
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

//SearchOnInternet
  Future<void> performSearchOnWeb(String userQuery) async {
    await Future.delayed(Duration(seconds: 1.9.toInt()));
    userQuery = userQuery.trim();
    print('Trimmed user query for search: $userQuery');
    if (userQuery.isNotEmpty) {
      print('Searching on Google: $userQuery');
      Uri url = Uri.parse('https://www.google.com/search?q=$userQuery');
      if (await canLaunchUrl(url)) {
        try {
          await launchUrl(url);
        } catch (error) {
          print('Error launching URL: $error');
        }
      } else {
        print('Could not launch Google search');
      }
    } else {
      // Handle empty response from Dialogflow
      print('The chatbot did not provide a search query.');
    }
  }

//SearchLocationOnMap
  Future<void> searchLocationOnMap(String locationName) async {
    await Future.delayed(Duration(seconds: 1));
    locationName = locationName.trim();
    if (locationName.isNotEmpty) {
      print('Searching on Google: $locationName');
      final Uri mapUrl = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$locationName");
      if (await canLaunchUrl(mapUrl)) {
        try {
          await launchUrl(mapUrl);
        } catch (error) {
          print('Error launching Google Maps URL: $error');
        }
      } else {
        print('Could not launch Google Maps');
      }
    } else {
      print('location name is empty.');
    }
  }

//openCameraAndTakePhoto
  Future<void> openCameraAndTakePhoto() async {
    await Future.delayed(Duration(seconds: 1));
    final imagePicker = ImagePicker();

    // Request camera permission
    final cameraStatus = await Permission.camera.request();
    if (cameraStatus != PermissionStatus.granted) {
      print('Camera permission denied');
      // Handle permission denial gracefully, e.g., display an error message
      return;
    }

    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();

      try {
        // 1. Request storage permission (if not already granted)
        final storageStatus = await Permission.storage.request();

        if (storageStatus == PermissionStatus.granted) {
          // 2. Get the external storage directory
          final appDirectory = await getExternalStorageDirectory();

          // 3. Create the Meyaa folder if it doesn't exist
          final meyaaDirectory = Directory('${appDirectory!.path}/Meyaa');
          if (!await meyaaDirectory.exists()) {
            await meyaaDirectory.create(recursive: true);
          }

          final fileName =
              DateTime.now().toString() + '.jpg'; // Customize filename
          final imageFile = File('${meyaaDirectory.path}/$fileName');

          // 4. Save the image to the Meyaa folder
          await imageFile.writeAsBytes(bytes);

          // 5. Add the image to the device's gallery
          final savedImagePath = await GallerySaver.saveImage(imageFile.path);

          if (savedImagePath != null) {
            print(
                'Image saved to Meyaa folder (external storage) and gallery: $savedImagePath');
          } else {
            print('Failed to save image to gallery.');
          }
        } else {
          print('Storage permission denied.');
          
          // Handle permission denial gracefully, e.g., display an error message
        }
      } catch (error) {
        print('Error saving image: $error');
        // Handle other errors gracefully
      }
    } else {
      print('Image selection cancelled.');
    }
  }

// Future<String?> saveImageToGallery(String imagePath) async {
//   final result = await GallerySaver.saveImage(imagePath);
//   // Check for null explicitly:
//   if (result != null && result) {
//     return imagePath;
//   } else {
//     return null;
//   }
// }

//OpenPhotos
  Future<void> openPhotos() async {
    await Future.delayed(Duration(seconds: 1));
    // Request photos permission
    final photosStatus = await Permission.photos.request();
    if (photosStatus != PermissionStatus.granted) {
      print('Photos permission denied');
      return;
    }
    if (photosStatus == PermissionStatus.granted) {
      try {
        // 1. Request photos permission (if not already granted)
        final storageStatus = await Permission.storage.request();

        if (storageStatus == PermissionStatus.granted) {
          final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );

          if (pickedFile != null) {
            // Handle the selected image here (e.g., display it, process it, etc.)
            print('Selected image path: ${pickedFile.path}');
          } else {
            print('Image selection cancelled.');
          }
        } else {
          print('Photos permission denied.');
          // Handle permission denial gracefully, e.g., display an error message
        }
      } catch (error) {
        print('Error opening photos: $error');
        // Handle error gracefully
      }
    }
  }

//ReadingNews
  Future<void> readNews(String newsQuery) async {
    await Future.delayed(Duration(seconds: 1.9.toInt()));
    newsQuery = newsQuery.trim();
    print('Trimmed News query for News search: $newsQuery');
    if (newsQuery.isNotEmpty) {
      print('Searching on Google News: $newsQuery');
      final url = Uri.parse('https://news.google.com/search?q=$newsQuery');
      if (await canLaunchUrl(url)) {
        try {
          await launchUrl(url);
        } catch (error) {
          print('Error launching URL: $error');
        }
      } else {
        print('Could not launch Google News');
      }
    } else {
      // Handle empty response from Dialogflow
      print('The chatbot did not provide a News query.');
    }
  }

//MusicPlayback
  Future<void> playMusic(String MusicQuery) async {
    if (MusicQuery.isNotEmpty) {
      print('Searching music: $MusicQuery');
      _showMusicProviderSelection(context, MusicQuery); // *Pass context here*
    } else {
      print('Search query is empty.');
    }
  }

  void _showMusicProviderSelection(
      BuildContext context, String MusicQuery) async {
    bool _isYoutubeSelected = false; // Track selection state
    // Delay the display for one second
    await Future.delayed(
        Duration(seconds: 1.5.toInt())); // Explicitly cast 1.5 to an integer

    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () async {
              Navigator.pop(context);
              final url = Uri.parse(
                  'https://www.youtube.com/results?search_query=$MusicQuery');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print('Could not launch YouTube');
              }
            },
            leading: InkWell(
              onTap: () async {
                setState(() => _isYoutubeSelected = true);
                Navigator.pop(context);
                final url = Uri.parse(
                    'https://www.youtube.com/results?search_query=$MusicQuery');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('Could not launch YouTube');
                }
              },
              child: Image.asset(
                'assets/images/icons8-youtube-48.png', // Path to your icon
                width: 48.0, // Adjust width as needed
                height: 48.0, // Adjust height as needed
              ),
            ),
            title: Text('YouTube', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
              // Open Spotify app if possible, otherwise open website
              final url = Uri.parse('spotify://search/$MusicQuery');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                final webUrl =
                    Uri.parse('https://open.spotify.com/search/$MusicQuery');
                if (await canLaunchUrl(webUrl)) {
                  await launchUrl(webUrl);
                } else {
                  print('Could not launch Spotify');
                }
              }
            },
            leading: InkWell(
              onTap: () async {
                setState(() => _isYoutubeSelected =
                    true); // Update for consistency (optional)
                Navigator.pop(context);
                final url = Uri.parse('spotify://search/$MusicQuery');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  final webUrl =
                      Uri.parse('https://open.spotify.com/search/$MusicQuery');
                  if (await canLaunchUrl(webUrl)) {
                    await launchUrl(webUrl);
                  } else {
                    print('Could not launch Spotify');
                  }
                }
              },
              child: Image.asset(
                'assets/images/icons8-spotify-48.png',
                width: 48.0,
                height: 48.0,
              ),
            ),
            title: Text('Spotify', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
              final url =
                  Uri.parse('https://soundcloud.com/search/$MusicQuery');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print('Could not launch SoundCloud');
              }
            },
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
                final url =
                    Uri.parse('https://soundcloud.com/search/$MusicQuery');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('Could not launch SoundCloud');
                }
              },
              child: Image.asset(
                'assets/images/icons8-soundcloud-logo-48.png', // Path to your icon
                width: 48.0, // Adjust width as needed
                height: 48.0, // Adjust height as needed
              ),
            ),
            title: Text('SoundCloud', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

//getWeatherForCity
  static const String apiKey = '6424affbbd28f74fb00505763d0c2b75';
  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode JSON response
      final data = json.decode(response.body);
      return data;
    } else {
      // Handle API errors
      print('Error fetching weather data: ${response.statusCode}');
      throw Exception('Failed to load weather data');
    }
  }

  Future<void> getWeather(String cityName) async {
    cityName = cityName.trim();

    if (cityName.isNotEmpty) {
      try {
        // Fetch weather data using the provided function
        Map<String, dynamic> weatherData = await fetchWeather(cityName);

        // Update UI with weather information
        updateUIWithWeather(weatherData);
      } catch (e) {
        print('Error fetching weather data: $e');
      }
    } else {
      print('City name is empty.');
    }
  }

  void updateUIWithWeather(Map<String, dynamic> weatherData) {
    final double temperature = weatherData['main']['temp'] - 273.15;
    final String formattedTemperature =
        temperature.toStringAsFixed(1); // Limit to 1 decimal place
    final String description = weatherData['weather'][0]['description'];
    final String cityName = weatherData['name'];

    final weatherMessage =
        'This is the Weather in $cityName now \nTemperature: $formattedTemperature°C\nDescription: $description'; // Add the message to the chat interface
    addMessage(Message(text: DialogText(text: [weatherMessage])), false);
    setState(() {});
    print('This is the Weather in $cityName now');
    print('  Temperature: $temperature°C');
    print('  Description: $description');
  }
}