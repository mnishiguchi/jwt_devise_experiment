# JWT Devise experiment

In this repo, I will learn how to implement a simple authentication system using
JWT and Devise.

I followed the tutorial
[An Introduction to Using JWT Authentication in Rails](https://www.sitepoint.com/introduction-to-using-jwt-in-rails/) by sitepoint.com

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

```
curl http://localhost:3000/react
```

You will receive a successful response with a JSON Web Token and additional user information.

```
$ curl -X POST -d email="user@example.com" -d password="password" http://localhost:3000/authentications
{"auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZGVudGl0eV9pZCI6MX0.9Srv3J08hpELrfzde2IHBdpFeNxkUtL-aGO_l1M6xF4","identity":{"id":
1,"email":"user@example.com"}}
```

With our fresh auth_token, you should receive a successful login response.

```
curl --header "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZGVudGl0eV9pZCI6MX0.9Srv3J08hpELrfzde2IHBdpFeNxkUtL-aGO_l1M6xF4" http://localhost:3000/react.json
{"logged_in":true}
```

---

## Some useful techniques

- [How To Set Up Devise AJAX Authentication With Rails 4.0](http://blog.andrewray.me/how-to-set-up-devise-ajax-authentication-with-rails-4-0/) by andrewray
- [Short Tip: Rescuing a Method in Ruby](http://seejohncode.com/2012/04/17/short-tip-rescuing-a-method-in-ruby/)
