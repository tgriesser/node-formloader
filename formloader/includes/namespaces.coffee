# Base Object Namespaces
Templates   = {}

Collections = {}
Models      = {}
Views       = {}
Pages       = {}
Navs        = {}

Routers     = {}
Helpers     = {}

# Last & Current pages to destroy on navigation
LastPage = null
CurrentPage = null

Socket = io.connect('http://localhost:3000')