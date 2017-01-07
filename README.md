# JWT Devise experiment

In this repo, I will learn how to implement a simple authentication system using
JWT and Devise.


#### Using Knock gem

- [Rails API by driftingruby.com](https://www.driftingruby.com/episodes?tag=api)

#### Using JWT gem

- [An Introduction to Using JWT Authentication in Rails](https://www.sitepoint.com/introduction-to-using-jwt-in-rails/) by sitepoint.com
- [Rails, Devise, JWT and the forgotten Warden](https://medium.com/@goncalvesjoao/rails-devise-jwt-and-the-forgotten-warden-67cfcf8a0b73#.k83x6ksr7)

---

## Libraries / gems

- [plataformatec/devise](https://github.com/plataformatec/devise)
- [jwt/ruby-jwt](https://github.com/jwt/ruby-jwt)
- and much more

---

## Get started

Create an identity from a terminal

```
rails c
>>> Identity.create(email:'user@example.com', password:'password', password_confirmation:'password')
```

Without any email or password, the response should be `{"errors":["Not Authenticated"]}`

```bash
$ curl -i http://localhost:3000/react
HTTP/1.1 401 Unauthorized
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: text/html
Cache-Control: no-cache

X-Request-Id: 84a098bf-da0a-4672-982e-2b519da79935
X-Runtime: 0.006754
Transfer-Encoding: chunked
```

You will receive a successful response with a JSON Web Token and additional user information.

```bash
$ curl -X POST "http://localhost:3000/identity_token" -d '{"auth": {"email": "user@example.com
", "password": "password"}}' -H "Content-Type: application/json"
{"jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0ODM4NDQ2NjEsInN1YiI6MX0.-n5R0et8Ick0qwoXdODE0kLpxCUuBGQPN2BKcOiYrkY"}
```

With our fresh auth_token, you should receive a successful login response.

```
$ curl -H "Authorization: JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0ODM4NDQ2NjEsInN1YiI6MX0.-n5R0et8Ick0qwoXdODE0kLpxCUuBGQPN2BKcOiYrkY" http://localhost:3000/react.json
{"logged_in":true}
```

---

## Some useful techniques

- [How To Set Up Devise AJAX Authentication With Rails 4.0](http://blog.andrewray.me/how-to-set-up-devise-ajax-authentication-with-rails-4-0/) by andrewray
- [Short Tip: Rescuing a Method in Ruby](http://seejohncode.com/2012/04/17/short-tip-rescuing-a-method-in-ruby/)
