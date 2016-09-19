# How to install Ruby

  - On Linux/UNIX:  
  ```$ sudo pacman -S ruby```
  - On OS X machines:  
  ```$ brew install ruby```
  - On Windows machines, you can use RubyInstaller.   
  http://rubyinstaller.org/

  For more info, visit https://www.ruby-lang.org/en/documentation/installation/

# How to install Git

  - On Linux:  
  ```$ sudo yum install git-all```
  - On Mac:   
  Run git from the Terminal. If you don’t have it installed already, it will prompt you for installation.
  - On Windows:   
  Go to http://git-scm.com/download/win and the download will start automatically.  

  For more info, visit https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

# How to install Redis
  - Download the stable version   
  http://redis.io/download

  For more info, visit http://redis.io/topics/quickstart

<br>
# Skill Example

This Sinatra app is an example of an AneedA skill. It connects to the Yelp search API.  

<br>
**How to set up and deploy**

First, set up your Yelp account:  

1. Visit https://www.yelp.com  
Register for an account and click on the activation email.  
2. Visit https://www.yelp.com/developers/api_console  

![Create Key](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/create_key.png?raw=true)

Click **Create key** and fill out the form.  


You can use http://example.com for the Website URL.   

![Create Key Form](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/create_key_form.png?raw=true)

After you click submit you will see your account secrets.  

  <br>
Now, set up your Heroku instance:  

3. Sign up for an account on heroku.com.  
4. Click **New -> Create new app**   
Click the Create app button   
Click Settings on the navbar.   
Copy the Git URL.  
4. Click **Reveal Config Vars**  
Create 4 new config vars with the secrets from Yelp:  
CONSUMER_KEY  
CONSUMER_SECRET  
TOKEN  
TOKEN_SECRET

<br>
Next, clone and deploy the app:   

5. Install Git.
6. Open a terminal.   
  Clone the app: `git clone git@github.com:iAmPlus/skills-template-sinatra.git`
7. `cd skills-template-sinatra`
6. `git remote add production <PASTE>`  
6. Add your SSH key to Heroku.  See this page: https://devcenter.heroku.com/articles/keys
7. `git push production`  

<br>
Test by visiting your app:

1. Click **Open app** from the Heroku page  
2. Update the URL in the browser:
 `https://<YOUR APP URL>/search?category_filter=sushi&location=los angeles`

![Response](https://github.com/iAmPlus/skills-template-sinatra/blob/master/images/success.png?raw=true)

<br>

# How to run locally   

cd to the project directory   

Setup a new Ruby project by running the following in the terminal:
  - rbenv local 2.3.1  
  - echo skills-template-sinatra > .rbenv-gemsets
  - rbenv gemset active
  - rbenv rehash
  - gem install bundler
  - bundle

Creat a file for storing the secrets:  
  - touch source-file.sh
  - put the following in the file:
  ```
  #!/bin/sh  
  export CONSUMER_KEY=<YOUR SECRET KEY HERE>  
  export CONSUMER_SECRET=<YOUR SECRET KEY HERE>  
  export TOKEN=<YOUR SECRET KEY HERE>  
  export TOKEN_SECRET=<YOUR SECRET KEY HERE>
  ```

Create .gitignore so that secret keys will not be pushed to Github:  
  - touch .gitignore
  - put the following in the .gitignore file:
  ```
  /log
  source-file.sh
  ```

To start the app:
  - in the terminal:
    - source source-file.sh
    - rackup
  - open Chrome
    - Update the URL in the browser: http://localhost:9292/search?category_filter=sushi&location=los%20angeles
