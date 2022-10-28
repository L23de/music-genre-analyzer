# Music Genre Analyzer

## Project Description

We aim to classify songs by predicting the probabilities of its genre
using a dataset of song genres and musical characteristics. This would
introduce an additional dimension for music professionals to identify
and verify genres of music that can be different from traditional
music theory.

The dataset will have to be cleaned and modified before being used in training and testing models. Certain attributes may be completely dropped, others may be given less weights (If the models allow), and others will have to be adjusted or normalized. Multiple models will be created, and the best model will be evaluated using metrics discussed in class.

## Target Audience

Our primary customers are song recommendation engines, with our model potentially improving song suggestions based on a user’s listening history. With better categorization of music, clustering algorithms can be improved to create more accurate recommendations. Another use case is web’s search engine optimization (SEO). Web developers create websites to maximize their SEO and discoverability on the web. The idea is that songs can be analyzed to better match songs with user queries. As a result, this tool will help elevate relatively undiscovered artists on the music charts.

## Limitations

Because the lyrics were originally collected by an external API and parsed using the spotipy library, we are inflexible to adding new data (E.g. music before 1950 or after 2019). New data would have to be run through the same process discussed in the paper, which can then be applied to our model. Some initial cleaning could involve the removal of the track name and lyrics attributes, since we do not plan to use them in any analysis techniques. Another way to clean the data would be to normalize the other attributes from [0,1] or utilizing standard deviations to create a better range that can ignore outliers before training and testing.

## Data Bio

- Brief: Our dataset comes from data.mendeley.com and is a comprehensive “list of lyrics from 1950 to 2019 describing music metadata as different attributes” collected from Echo Nest API and analyzed using Python’s spotify library
- Size: 28372 samples
    A- ttributes/topics (30): [artist name, track name, release date, lyrics, len, dating, violence, world life, night time, shake the audience, family gospel, romantic, communication, obscene, music, movement places, light visual perceptions, family spiritual, like girls, sadness, feelings, danceability, loudness, acousticness, instrumentalness, valence energy, topic, age]
- Target Variable, Genre (7): [pop, country, blues, jazz, reggae, rock, and hip hop]
- Source: https://data.mendeley.com/datasets/3t9vbwxgr5/2
- Explanation: Vista do Temporal Analysis and Visualisation of Music (sbc.org.br)
