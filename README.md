# Skill Example

This Sinatra app is an example of an AneedA skill. It connects to the Yelp API to search.  

<br>
**How to set up and deploy:**

First, set up your Yelp account:  

1. Visit https://www.yelp.com  
Register for an account and activate via email.  
2. Visit https://www.yelp.com/developers/api_console  

![Create Key](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/create_key.png?raw=true)

Click **Create key** and fill out the form.  


You can use http://example.com for the Website URL.   

![Create Key Form](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/create_key_form.png?raw=true)

After you click submit you will see your account secrets.  

  <br>
Now, set up your Heroku instance:  

3. Sign up for an account on Heroku.com  
4. Click **New -> Create new app** and click Settings. Copy the Git URL.  
4. Click **Reveal Config Vars**  
Create 4 new config vars with the secrets from Yelp  
CONSUMER_KEY, 
CONSUMER_SECRET, 
TOKEN, 
TOKEN_SECRET

<br>
Next, clone and deploy the app:   

5. Install Git.
6. Open a terminal.   
  Clone the app: `git clone git@github.com:iAmPlus/skills-template-sinatra.git`
7. `cd skills-template-sinatra`
6. git add remote production <PASTE>  
   You will need to have git installed.  
6. And add your SSH key to heroku  
7. `git push production`  

<br>
Test by visiting your app:

1. Click **Open app** from the Heroku page  
2. Update the URL in the browser:
 `https://<YOUR APP URL>/search?category_filter=sushi&location=los angeles`

![Response](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/success.png?raw=true)