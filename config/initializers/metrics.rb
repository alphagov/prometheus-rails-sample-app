MetricsService.register(
  :tweets_this_session,
  :counter,
  "The number of tweets created since starting the server."
)

MetricsService.register(
  :total_tweets,
  :gauge,
  "The total number of tweets in the database."
)
