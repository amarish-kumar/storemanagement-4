# MyLedger Django RestAPI

Django Admin dashboard http://storemanagement.durlov.com/admin
RestAPI http://storemanagement.durlov.com/api

Test username: `testuser2`, password: 'asdf1234'
Admin user `admin`, `1234!@#$`


# Sample API calls

Registration

POST http://storemanagement.durlov.com/auth/register/
<pre>
<code>
{
	"username": "testuser3",
	"password": "12345678",
	"first_name": "Test",
	"last_name": "User 3",
	"email": "test3@user.com"
}
</code>
</pre>

Login

POST http://storemanagement.durlov.com/auth/login/
<pre>
<code>
{
	"username": "0469893062",
	"password": "asdf1234"
}

or

{
	"phone": "04XXXXXXX",
	"password": "asdf1234"
}

or 

{
	"email": "test3@user.com",
	"password": "asdf1234"
}

</code>
</pre>

Social Registration & Login

POST http://storemanagement.durlov.com/auth/social/
<pre>
<code>
{
	"network": "facebook",
	"identifier": "767676767676", // identifier provided by facebook
	"token": "EAAc......", // token provided by facebook
	"email": "test3@user.com",
	"first_name": "Test",
	"last_name": "User3"
}
</code>
</pre>

Follow http://storemanagement.durlov.com/api for API samples

http://storemanagement.durlov.com/api/order/?embed_address=1