#9.1 How the Web Works

###Release 0: HTTP Requests

1. *What are some common HTTP status codes?*

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

