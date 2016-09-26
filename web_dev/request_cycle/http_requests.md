#9.1 How the Web Works
Release 0: HTTP Requests

####1) *What are some common HTTP status codes?*

* **100s** - informational
    * **100 (Continue)** - Everything so far is going OK and the client should continue with the request
* **200s** - success
    * **200 (OK)** - the request has succeeded
    * **201 (Created)** - The request has succeeded and a new resource has been created because of it. (Usually because of a PUT request)
    * **204 (No Content)** - No content to send for this request
* **300s** - redirection
    * **300 (Multiple Choice)** - The resource requested has moved or the URL provided isn't specific enough
    * **301 (Moved Permanently)** - The URI (Uniform Resource Identifier) of the requested resource has been changed
    * **302 (Found)** - The URI of the requested resource has been changed temporarily
* **400s** - client-side errors
    * **400 (Bad Request)** - The server telling you the request was either corrupted or your browser accessed the server incorrectly
    * **401 (Unauthorized)** - When you don't have authorization to access the page requested, usually because you need a password to log in
    * **403 (Forbidden)** - The server understands the request, but refuses to fulfill it
    * **404 (Not Found)** - The server cannot find the resource that was requested
    * **410 (Gone)** - The resource requested has been deleted
    * **451 (Unavailable for Legal Reasons)** - For an illegal resource, like a page censored by the government
* **500s** - server-side problems
    * **500 (Internal Server Error)** - Something wrong with the server
    * **503 (Service Unavailable)** - The server is not ready for the request. Either its down for maintenance or overloaded

####2) *What is the difference between a GET request and a POST request? When might each be used?*

GET requests data from a specified resource. POST submits data to be processed to a resource. In other words, GET is for retrieving data, POST is for writing data.

**Differences**:

* GETs can be cached, while POSTs are not
* GETs shouldn't change the server, POSTs can change the server
* GETs remain in browser history, POSTs do not
* GETs can be bookmarked, POSTs cannot
* GETs have length restrictions(since they are in the URL), POSTs do not
* GETs are restricted to ASCII characters, POSTs are not and can allow binary
* GET parameters are in URL, POST parameters are in the body


####3) *What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?*

a cookie is small text file sent from a server and stored in a user's web browser while the user is browsing the page. It is then typically sent back together with the next request to the server. Typically used for 3 purposes: 1) session management (managing user logins or maintaining items in a shopping cart) 2) personalization and 3) tracking.

Cookies are sent when returning an HTTP object to a client who has made a request to a server. Cookies are then typically returned to the server with any following HTTP requests.
