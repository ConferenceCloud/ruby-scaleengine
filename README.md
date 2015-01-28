# ruby-scaleengine
A ruby client for the ScaleEngine Livestream Network API. [www.scaleengine.com](http://www.scaleengine.com)

## Example
```
se = ScaleEngine.new
req = se.files.getstorage
resp = req.send
```

## Install (Coming soon)
```
gem install ruby-scaleengine
```

Rails (Gemfile)
```
gem 'ruby-scaleengine'
```

## API Controls
The ScaleEngine API is organized such that all requests go to a single endpoint, and the type of request (ie sevu.addstreamuser) is a request parameter.
So this client library is designed around the request command.

All request types are found in the official documentation [Docs](https://cp.scaleengine.net/docs/api/)

### Sevu
##### Add Stream User
Command: `sevu.addstreamuser`

##### Attemps
Command: `sevu.errorlog`

