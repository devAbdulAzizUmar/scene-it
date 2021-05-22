import 'package:first_app/Models/MotivationalStory.dart';
import 'package:first_app/Screens/story-screen.dart';
import 'package:flutter/material.dart';

class Motivationalquotes extends StatefulWidget {
  static const routeName = "MotivationalQuotes";
  @override
  _MotivationalquotesState createState() => _MotivationalquotesState();
}

class _MotivationalquotesState extends State<Motivationalquotes> {
  @override
  Widget build(BuildContext context) {
    final List<MotivationalStory> stories = [
      MotivationalStory(
        title: "Walt Disney",
        subtitle: "The story of a revolutionist",
        image: 'assets/storyimages/disney.jpeg',
        story:
            "Walt Disney (1901-1966) was an American entrepreneur who did innovating work in animations and cartoon production but not only was he skilled at his craft, he built a billion dollar business off of making cartoons from his garage. Today, Disney is one of the most recognized names in the world as a company which owns multiple productions as well as toys. \n\nWalt Disney was a man of determination and perseverance as can be seen even before everything, when at the age of 16, he fought in World War One, and even then he had a creative spirit because he customized his ambulance with his personal cartoon drawings.\n At first, he had an advertising job & most people would consider themselves lucky to have one, but this man had the desire to achieve so he left that job to start a business alongside his brother in a garage. Normally, people are scared of this kind of risk taking but he followed his passion even though it meant being unemployed.\n\n Eventually, they even got a good contract with another company by the name of Universal for which they made cartoons but when they realized that they weren’t really valued as anything more than hired labour, he made another risky decision to leave the company alongside his created cartoon as Universal had the rights for them but with determination & desire he pushed forward.\n\n This is where Disney relied on his creativeness again & went on to produce the well recognized character that we know today as Micky Mouse. However, times were changing & with the advent of sound in Hollywood, he reworked his creation with the implementation of sound. Steamboat Willie, released in 1928, was the first animated film to feature synchronized sound. This was an international success but he did not stop there, he still had that desire to improve.\n\n Disney kept on implementing the newest technologies that came out to his cartoons and made colour cartoons that won him an Academy Award in 1932. He also went on to win 26 Oscars over his career & also started working on feature films and released Snow White & the Seven Dwarfs which was the first feature-length animated movie to be produced in Technicolor and cost nearly \$1.5 million to make.",
        storyImage: 'assets/storyimages/disneyStory.jpeg',
      ),
      MotivationalStory(
        title: "Albert Mubatsa",
        subtitle: "Winner of Drawing Contest 2019",
        image: 'assets/storyimages/albert.PNG',
        story:
            "Albert’s drawing is inspired by the economic condition of his country.\n\nThe torn map of Zimbabwe symbolizes the economic and political situation, as the future seems uncertain due to the instability in the sectors. The ostrich represents Zimbabweans. Ostriches are known for burying their heads in the sand, and that's the similar case with most Zimbabweans. They try to hide away from the country, and thus hiding their identity in the process. Ostriches are also the biggest birds, and have the longest necks in the bird kingdom, and the largest eyes of any land animal, thus, the same Zimbabweans should also use their strengths to focus on building the country, and the future. The small hand holding the flag, is a reminder for Zimbabweans to stand tall and raise the Zimbabwean status higher and believe in themselves.",
        storyImage: 'assets/storyimages/albertStory.jpg',
      ),
      MotivationalStory(
        title: "Jo Ranocchia",
        subtitle: "Winner of Pastel Painting Contest",
        image: 'assets/storyimages/jo.PNG',
        story:
            'Colourful Lies by Jo Ranocchia is a pastel painting full of colours and deep meaning. Jo says that the face at first glance will attract one because of its vibrant colours and fails to express her true emotions. In the painting, it seems as if the girl is hiding her true self behind the bright paint that initially gives an impression of happiness, however, it also seems like she is struggling with feelings of inadequacy. Jo felt a deeper connection with this art piece because it reflects her. It makes her feel as if it is her own life depicted in this masterpiece.',
        storyImage: 'assets/storyimages/joStory.jpg',
      ),
      MotivationalStory(
        title: "Jeanette Sirois",
        subtitle: "Winner of Coloured Pencil Contest",
        image: 'assets/storyimages/jeanette.PNG',
        story:
            "Reflections of a Blood Orange created with Luminance, Pablo and Polymorphous colour pencils is a drawing that explores the intricate details of the natural world around us. The piece incorporates lots of small details about the subject.\n\nThe artist is fascinated by nature and what it presents to us and how we interact with it every day. The intention of her work is to allow each of us the opportunity to explore, in greater detail those natural elements and then slow down and look at the beauty in colour, line and form. It's amazing what we see when we look more closely and the opportunities presented to us. By the simple act of peeling an orange we are presented to a treat for the eyes, nose and taste. This work was inspired by that beauty and it is an honour to be given an opportunity, by the natural world, to draw such lovely subject matter.",
        storyImage: 'assets/storyimages/jeanetteStory.jpg',
      ),
      MotivationalStory(
        title: "Rosemary Bennett",
        subtitle: "Winner of Watercolour Painting Contest",
        image: 'assets/storyimages/rosemary.PNG',
        story:
            'Rosemary Bennett has been painting since childhood. She is proficient in many mediums but did paint exclusively in watercolors for twenty years. She is more an Illustrator with watercolour but uses all the techniques with the medium to produce the end result she desires. She continues to create and enjoys her time with art.\n\nShe went to Loire Valley for a painting trip and ended the trip by going to Paris. While she was in Paris, she visited a cafe which was full of colors & life. She took a few photos and later painted them with watercolour on paper. She used watercolour as an extension of her feelings about being in the City of Lights. She believes that watercolour was an apt choice to depict this scene.',
        storyImage: 'assets/storyimages/rosemaryStory.jpg',
      ),
      MotivationalStory(
        title: "Linda Millar",
        subtitle: "Winner of What’s Your Story Contest",
        image: 'assets/storyimages/linda.PNG',
        story:
            "The artist herself shares her story as follows.\n\nMy name Is Linda Millar and I am an artist. It's pretty thrilling to see those words in writing! I was born into a first generation German family, in Windsor Ontario.\n\nOur family was poor and moved often. I was expelled from high school 3 months into Grade 10 because I didn't own the uniform that made up the school's dress code. In hindsight, I'm pretty amazed I managed so long just by borrowing uniforms from friends! I didn't return to finish high school until I was 37 years old. It was a life-changing, awesome adventure to befriend a bunch of teenagers and discover I was an adept student. In fact, at graduation, I was named valedictorian. After receiving several scholarships, I entered the Journalism/Print/New Media program at St. Clare College; the Windsor Star hired me before I graduated. I'd like to say I had an interest in art during those years, but life was so busy with family, school, and work, I didn't have time for creating. And then I moved to Northern Ontario. I was so lonely, I bought and learned to use pastel pencils.\n\nI was 48 years old. At first, drawing was a way to fill in the isolated, dreary winter hours. It wasn't long before I was using chalk pastels and to this day, this is my favourite medium. Acrylic painting became a passion a couple of years later; I was drawn to it because the paint dried fast, and I could gesso over any messes I made (which were many.)\n\nI am self-taught and because of this, I don't have a lot of confidence as a painter. I don't belong to any artist groups, although I'm considering this as I go forward. Recently, I've begun to paint with watercolours. I created a series of Christmas cards, made prints of them, and sent them to family and friends. I was so surprised to see how well they were received - many people framed their cards! This really boosted my confidence. Still, I tend to work quite slowly as an artist, mainly because I use art as a meditation. It requires me to be present in each moment I'm working, and this has a deeply calming effect on my perspective and state of mind.\n\nBeing able to create something that didn't exist before I picked up a paintbrush, feels spiritual to me. I am most content and 'at home' when I'm working on a painting. Even when things aren't going well, I feel harmony with myself, God, and creation, when I paint. Art gives me a sense of doing what I was intended to. The whole creative process brings me joy, peace and a sense of being who I really am. I'm learning about light these days. How light bends our perception of an object through things like water or glass, is really interesting to me. I'm also learning to depict how water magnifies or distorts an object it's covering. Colour theory is an area I am determined to make greater progress in, but I know the time has come for me to receive some professional instruction if I'm to do this\n\nFor me, painting feels the same as writing. I am communicating something about myself in every stroke of the brush, or pastel. And I often learn important things about myself in the process of creating. Being willing to share what I've learned through allowing others to view what I've made, proves to me that I'm growing in confidence and self-knowledge. Art is a vehicle for me to learn about the natural world as well as my inner world.\n\nArt is what I use to present what I've learned. I am a life-long learner, so I know I will always paint.\n\n",
        storyImage: 'assets/storyimages/lindaStory.jpg',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Motivational Stories"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(color: Colors.white54),
        child: Padding(
          padding: EdgeInsets.only(top: 17),
          child: Container(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      top: 12,
                    ),
                    alignment: Alignment.center,
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(children: [
                      ////Main Heading/////
                      Text(
                        "Artists' Success Stories",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Never lose hope, you can make it too!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, StoryScreen.routeName,
                            arguments: {
                              "title": stories[index].title,
                              "story": stories[index].story,
                              "storyImage": stories[index].storyImage,
                            });
                      },
                      child: Card(
                        color: Colors.blueGrey[100],
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    stories[index].image,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stories[index].title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      stories[index].subtitle,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
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
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
