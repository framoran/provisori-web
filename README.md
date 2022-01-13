# Notes for the evaluation purpose

## Server
The project has been deployed to production on Heroku. This is the link: https://thawing-mountain-42006.herokuapp.com/

## Seed data
For the localhost test of the platform there are 3 users:
* Admin: email : admin@extensionschool.ch and password : test
* Normal user: email : normal@extensionschool.ch and password : test
* Normal user 2 : email: normal2@extensionschool.ch and password : test

## Custom CSS
Most of the project is built with Bulma which is a small CSS framework that gives strong cohence between views. However, for the evaluation purpose I used custom CSS and I used SASS as requested. All the code can be found in app/assets/sass. There are partials and the main scss file application.scss

## Javascript
As described below I used Custom Javascript to build an interactive article builder. This JavaScript can be found in app/assets/javascript/form.js.erb

## Language
The website will be entirely in French as the audience is for French users but for evaluation purpose I translated the website in english. The question of the game however will appear in the language that the admin wants (if he decides to do an enigma in french, it will be in french). This means that it is possible to have everything in english but for a normal user except the question. <strong> For the admin user part, everything is in French as the admin user is a French speaker.</strong>.

## Changes from the initial project proposal
<ol>
 <li>
    The project has several changes from the initial project proposal. These changes come from the Customer (my friend journalist) who decided to have article with different content directly integrated inside (paragraph, video, podcasts etc…). Indeed, he asked me a WordPress like builder for his articles, which I found challenging to integrate but interesting for the evaluation purpose. I decided to create a form builder with JavaScript in order that the Journalist can add as many videos, podcasts, paragraph he would like, then save the work. This is inspired by https://www.konbini.com/fr/. This is a major change because instead of displaying articles, videos, images as separate articles, everything is displayed as one single article. To do this, I use two models:

   ## Articles
   ### Attributes:
   * t.string title
   * t.string like
   * t.integer published
   * t.integer group1
   * t.integer group2
   * t.integer group3
   * t.integer group4
   * t.integer group5
   * t.integer group6
   * t.integer image
   * t.integer alt
   * t.timestamp created_at
   * t.timestamp modified_at
   #### Associations:
   * has_many elements, as: :elements
   * has_many comments, as: :response
   * has_many :like, as: :votable
   ### Elements:
   * t.references article
   * t.string elements_type
   * t.string subtitle1
   * t.string subtitle2
   * t.string body
   * t.string src
   * t.string alt
   * t.string imgart
   * t.timestamp created_at
   * t.timestamp modified_at
   #### Associations:
   * belongs_to article
 </li>
 <li>I also add a publish / unpublished function to allow the journalist to retire articles. </ul>
 <li> Another change regard the rating function: he decided to have a simple like function instead of stars from 1 to 5 because he found the like solution more in line with the social media websites. </li>

 </ol>

### Things that needs to be implemented in future

#### I did not implement:
* the stats
* the contact page
* the rating of the best content of the week
* the mailing system. This is because of a time constraint for the evaluation purpose
#### Also
* The social network buttons (facebook, instagram etc...) in the footer do not link to anything for now. This is because the journalist has not created them yet.

# Capstone project proposal outline

## Project name

### Provisori media (https://provisori.media) - not working for now because it needs to be bought

## Application purpose

* Application global description

  * In my professional network, a journalist I know asked me if it was possible to develop a webapp for him to launch a new media. As a freelance journalist, his ambition is to launch a new innovative media to diversify the editorial offer to the general public and especially to propose new interactions between audiences and media actors. To do so, he needs a platform able to broadcast any kind of content and format while allowing the public to take part in various digital interactions: voting system, gamification and participative journalism (described in the following document).

  * This request seems to me as relevant as it is realistic since it expresses a tangible economic and creative need. The realization of this project would allow me to put my digital skills at the service of an entrepreneurial initiative beneficial to the plurality of media, to the diversification of culture and to the exploration of new models in the media industry.

  * This project would therefore solve a central problem in the media field: the engagement and interaction with audiences (more than necessary nowadays in order to gain and retain users and audiences). A problem that all media face and that, until now, has not been solved. Indeed, "institutional" media and new media players seem to be limited until now in the elaboration of communication and community management campaigns using social networks. The idea of the project is therefore to go much further, by fully exploiting the digital potential of an online media platform that will innovate through the new interactions it will allow.

  * These developments also open up new commercial perspectives with a view to gamifying both the information and any sponsored approaches to the medium, with the aim of breaking with current models that tend to deteriorate the user experience and the quality of contents.

* Application technical description

  * A dashboard where an admin user can:

    * upload articles, podcasts and videos and comments
    * edit podcasts and videos and comments
    * delete podcasts and videos and comments
    * manage users (edit and delete users)

  * A plateform where users can:  

     * read articles, podcasts and videos
     * comments articles, podcasts and videos
     * rate articles, podcasts and videos
     * play to a game proposed each week (respond to an enigma)


## Tech

### Ruby on Rails version 6.1.4.1

## Front end

### General description:

The webapp is for a journalist who wants to add articles, videos and podcasts. He would like a webapp that could broadcast three different kinds of format (articles, videos, podcasts). For each format, he needs to be able to :

<li> Manage articles, videos, podcasts  <br /> <br/>
  <ol>
    <li> write and submit articles / videos / podcasts </li>
    <li> edit articles / videos / podcasts </li>
    <li> suppress articles / videos /  podcasts </li>
  </ol>
</li>
<li>
  Manage users <br /> <br/>
 <ol>
    <li> edit users </li>
    <li> suppress users </li>
  </ol>
</li>
<br />
The articles / videos / podcasts will have a button show. Once clicked the admin will have the possibility to sees comments of logged users. He will have the possibility to:

<ol><br />
  <li> add comments </li>
  <li> edit comments </li>
  <li> suppress comments </li>
</ol>

Users will have the possibility to log in the application. Once logged, they will have the possibility to:

<ol>
  <li> add comments to articles / podcasts / videos </li>
  <li> edit comments to articles / podcasts / videos </li>
  <li> rate the content of articles and podcasts. I plan to use a Front-end preexisting code <a href="https://codepen.io/knyttneve/pen/EBNqPN" target="blank">here </a></li>
</ol>

####  The vote:

Each Friday users can vote for their favorite article, video, podcast of the week. Then next week, the content will be displayed on the main page as the « Best content of last week » to get more views and interactions with the readership (will be implemented as a second step).

####  The game:

Each Monday a didactic enigma will be displayed. The enigma can be:

<ol>
  <li>A question: Participants will need to answer a question with one word. (e.g., <em> I never breathe but I have a lot of breath. Who am I ? </em>)</li>
  <li>A picture: Participants will need to find the character behind a picture </li>
  <li>A song: Participants will listen to a song and find what is the song </li>
</ol>

The correct answer of the weekly enigma will be given in an article the next day (Tuesday) in order to boost the web activity and flow on the contents. The winner will be randomly selected each Friday among users who provided the correct response. The winner will have the possibility to benefit from an article about him/her, to highlight a project of him/her or in his/her surrounding or he/she could also decide on what topic or problematic he/she would like to read a tailor made content. The admin will be informed of the winner by email.

#### Subscription:

Some of the contents will be reserved to users with a subscription. Stripe will be used as a system as a payment gateway.

### The pages:

Here is the list of the pages that I imagined for now:

<ol>
 <li>Home -> users will see all the Articles on this page</li>
 <li>Videos -> users will see all the Videos on thie page</li>
 <li>Podcasts -> users will see all the Podcasts on thie page</li>
 <li>Login -> users will see the enigma of the week on this page</li>
 <li>Register -> users will see the enigma of the week on this page</li>
 <li>Account -> users will be able to modify their profile on this page</li>
 <li>Users -> only admin will have access to this page that will display all the users</li>
 <li>Statistics -> only admin will have access to this page that will display all the statistics</li>
 <li>Game -> participants will see the enigma of the week on this page</li>
</ol>

### CSS

* Most of the implementation will be done using Bulma as CSS framework.

* However, for the scope of the examination:

 * I will display the articles using a custom grid system.
 * I will also use a specific size system to be coherent with all the pages. The exact size of the font needs to be checked with the journalist that want first to have a look at a first version of the website.
 * The font-family will be: Open sans
 * I will also use a custom footer for the examination purpose.

 ### JavaScript

* JavaScript will be used to improve users' experience.
 * JavaScript will be used to create a custom notification system.
   * When clients comment or rate an article, a notification will be displayed in green on the screen.
   * When there is something wrong, a red notification will appear on the screen. When participants respon to the game.
 * JavaScript will be used to create an animation when participants respond to the game.
   * When participants respond correctly to the game, an animation with a smiley will appear on the screen.
   * When participants do not respond correctly to the game, an animation with a funny smiley encouraging the participants to try again will appear on the screen.
 * JavaScript will be used to create / edit / delete comments and rate comments that belong to articles asynchronously. This will improve participant's experience. As you are developers, if you know other animations that can be implemented to improve users' experience, I would be interested as it is the core of the present project: to have the best possible users experience.
 * Important: It's not planned that I use the JavaScript to create, update or delete articles / podcast / videos asynchronously for the admin user as it is not relevant to him that he has an optimized user experience. It is more important to him that I spend all the time and energy in the users experience and not the admin one.

## Data structures and models

#### Models:

<ul>
  <li> Users
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string name</li>
          <li>t.string last_name</li>
          <li>t.string email</li>
          <li>t.string password</li>
          <li>t.integer response_game</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>has_many :comments</li>
          <li>has_many :articles </li>
          <li>has_many :podcasts </li>
          <li>has_many :videos </li>
        </ul>
      </li>      
    </ul>
  </li>
  <li> Articles
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string title</li>
          <li>t.string body</li>
          <li>t.integer view</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to user</li>
          <li>has_many comments, as: :response </li>
          <li>has_many :ratings, as: :votable </li>
        </ul>
      </li>
    </ul>
  </li>

  <li> Videos
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string title</li>
          <li>t.string description</li>
          <li>t.string src</li>
          <li>t.integer view</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to user</li>
          <li>has_many :comments, as: :response </li>
          <li>has_many :ratings, as: :votable </li>
        </ul>
      </li>
    </ul>
  </li>

  <li> Podcasts
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string title</li>
          <li>t.string description</li>
          <li>t.string src</li>
          <li>t.integer view</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to user</li>
          <li>has_many : Comments, as: :response </li>7
          <li>has_many :ratings, as: :votable </li>
        </ul>
      </li>
    </ul>
  </li>

  <li> Comments
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string text</li>
          <li>t.integer user_id</li>
          <li>t.integer response_id</li>
          <li>t.integer response_type</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to :user </li>
          <li>belongs_to :response, polymorphic: true</li>
        </ul>
      </li>
    </ul>
  </li>

  <li>Ratings
    <ul>
      <li>Attributes:
        <ul>
          <li>t.integer rate</li>
          <li>t.integer user_id</li>
          <li>t.integer votable_id</li>
          <li>t.integer votable_type</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to :user </li>
          <li>belongs_to :votable, polymorphic: true</li>
        </ul>
      </li>
    </ul>
  </li>

  <li> Subscription
    <ul>
      <li> Attributes:
        <ul>
          <li>t.integer user_id</li>
          <li>t.integer subscribed</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to :user</li>
        </ul>
      </li>
    </ul>
  </li>

  <li> Game
    <ul>
      <li>Attributes:
        <ul>
          <li>t.string question</li>
          <li>t.integer type_of_question</li>
          <li>t.string src</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>has_many :winners</li>
    </ul>
  </li>

  <li> Winner
    <ul>
      <li>Attributes:
        <ul>
          <li>t.integer user_id</li>
          <li>t.integer question_id</li>
          <li>t.integer type_of_question</li>
          <li>t.integer src</li>
          <li>t.integer text</li>
          <li>t.timestamp created_at</li>
          <li>t.timestamp modified_at</li>
        </ul>
      </li>
      <li>Associations:
        <ul>
          <li>belongs_to :user</li>
          <li>belongs_to :game</li>
        </ul>
      </li>
    </ul>
  </li>

 <li>BestArticle (will be implemented as a second step). </li>

  <li> Statistics (will be implemented as a second step).

   * This model will contain all the statistics of participants clicks. If a user click on an article, on a videos, on a podcast, the model will be updated with the click information. Each day the number of click on articles, videos and podcasts will be registered. This model will be linked with the Articles, Videos, and Podcasts models using polymorphic association. The number of registered users, login will be also recorded. This will be implemented in the future. The details of the required statistics needed to be discussed during a meeting with the journalist once a first draft of the website is available.
 </li>

</ul>

## Third party services
<ul>
  <br />
  <li>
    Gems:
      <ul>
        <li>Figaro: a way to securely configure Rails applications. <a href="https://github.com/laserlemon/figaro" traget="blank">See here </a></li>
        <li>Stripe: a way to accept payments online. <a href="https://rubygems.org/gems/stripe/versions/1.57.1" traget="blank">See here </a></li>
        <li>Gruff: a way to display beatiful graphs. <a href="https://rubygems.org/gems/gruff/versions/0.7.0?locale=fr" target="blank">See here </a></li>
        <li>Mail: a way to implement how to send email fast. <a href="https://rubygems.org/gems/mail/versions/2.6.4" target="blank">See here </a>
         * I plan to use the Sengrid ActionMailer. I will use the following tutorial: https://docs.sendgrid.com/for-developers/sending-email/rubyonrails</li>
      </ul>
  </li>
  <br />
  <li>
    CSS:
      <ul>
        <li>I plan to use BULMA as CSS framework. I will also use custom CSS along with Bulma to create custom part of the views.</li>
      </ul>
  </li>
  <br />
  <li>
    API:
      <ul>
        <li>I plan to use the Stripe API as payment gateway. This will use to create subscription for users who want to read special contents.</li>
        <li>I plan to use the Amazon Web Servoce to upload images, videos and songs.</li>
        <li>I plan to use Google Analytics to collect information about users behaviors.</li>
      </ul>
  </li>
  <br />
  <li>
    Deployment server:
      <ul>
        <li>Heroku will used as deployment service.</li>
      </ul>
  </li>
