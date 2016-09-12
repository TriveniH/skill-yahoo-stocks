# Skill Example

This Sinatra app is an example of an AneedA skill. It connects to the Yelp API to search.

How to set it up:
1. Go to https://www.yelp.com
Register for an account and activate via email.
2. Go to https://www.yelp.com/developers/api_console
Cick create key and fill out the form.
You can use http://example.com for the Website URL.
You will see your account secrets.
3. Sign up for an account on Heroku.com
4. Create new app and click setting. Copy the Git URL.
4. Click Settings, and Reveal Config Vars
Create 4 new config vars with the secrets from Yelp
CONSUMER_KEY
CONSUMER_SECRET
TOKEN
TOKEN_SECRET
5. In a terminal, git add remote production <PASTE>
   You will need to have git installed.
6. And add your SSH key to heroku
7. git push production
8. Visit https://<YOUR APP URL>/search?category_filter=sushi&location=los angeles