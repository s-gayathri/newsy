// DUMMY CLASS TO USE INSTEAD OF API DURING DEVELOPMENT
// May not be used once we switch over to API since
// it returns JSON object when we request for the news based on a topic

class News {
  String title, body, image, source, author, originalArticle, date, description;

  News(
      {this.title,
      this.body,
      this.image,
      this.source,
      this.author,
      this.originalArticle,
      this.date,
      this.description});

  static List<News> getNews() {
    final List<News> news = [
      News(
        // SUPER LONG TITLE JUST TO CHECK HOW THE APP RENDERS IT.
        // ALSO IN THE API MOST OF THE HEADLINES ARE CONSIDERABLY LONG
        title:
            'Holi to be celebrated soon all over India! Holi to be celebrated soon all over India! Holi to be celebrated soon all over India!',
        body: 'LOREM IPSUM',
        image:
            'https://photoworkshopadventures.com/wp-content/uploads/2020/05/04-photo-workshop-adventures-priyank-tyagi-india-holi-festival.jpg',
      ),
      News(
        title: 'Pollution has decreased considerably due to pandemic.',
        body: 'LOREM IPSUM',
        image:
            'https://www.demilked.com/magazine/wp-content/uploads/2020/04/5ea143253d1ae-cities-air-pollution-coronavirus-lockdown-coverimage.jpg',
      ),
      News(
        title: 'Gaming is a very good recreation during this lockdown.',
        body: 'LOREM IPSUM',
        image:
            'https://securitybrief.eu/uploads/story/2020/06/22/gamingggg.jpg',
      ),
      News(
        title: 'Tik Tok is banned in India !',
        body: 'LOREM IPSUM',
        image:
            'https://techcrunch.com/wp-content/uploads/2019/10/tiktok-censorship.jpg',
      )
    ];
    return news;
  }
}
