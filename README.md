# README

1. Go to project root repository
2. Run `bundle install`
3. Edit credentials.tml.enc (Editor can be either nano, vi or vim) 
   `EDITOR="nano" rails credentials:edit`

4. Add credentials for developement env

    	development:

       	db_username: your_postgres_username

       	db_password: your_postgres_password

       	api_token: your_api_token_to_authenticate_signup_login_apis
				

5. Create database for application
   `rails db:create`
6. Start the server
   `rails s`

