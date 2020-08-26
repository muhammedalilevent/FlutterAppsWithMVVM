



class Constants {

  static String TOP_HEADLINES_URL="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=70b3b4f34b77489c8180c022e8ab681a";
  static String headlinesFor(String keyword)
  {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=70b3b4f34b77489c8180c022e8ab681a";
  }
}