class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent(
      {required this.image, required this.discription, required this.title});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'Weather forcast',
      image: 'assets/images/onbording11.jpg',
      discription:
          'Welcome to the weather app, stay informed about its conditions and follow all that is new'),
  OnbordingContent(
      title: 'News over the world',
      image: 'assets/images/onbordin2.jpg',
      discription:
          "Sometimes it rains heavily and you need a coat, so Keep Track is a weather forecast app "),
  OnbordingContent(
      title: 'Travel guiad',
      image: 'assets/images/onbording3.jpg',
      discription:
          'You can also know the tourist places and weather for many countries. If you are a fan of travel, start with us'),
];
// "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
//           "industry's standard dummy text ever since the 1500s, "