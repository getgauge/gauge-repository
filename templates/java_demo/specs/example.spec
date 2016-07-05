Email format verification
=========================
These are test cases for emails format verification

Verify various formats of emails
---------------------------

* verify that email "user@domain.com" is valid
* verify that email "user@domain.co.in" is valid
* verify that email "user_name@domain.com" is valid
* verify that email "username." is invalid

Verify various formats of emails with table params
-----------------------------

* verify emails
     |id                 |is valid|
     |-------------------|--------|
     |user@domain.com    |true    |
     |.username@yahoo.com|false   |
     |username@yahoo.com.|false   |
     |username@yahoo..com|false   |
