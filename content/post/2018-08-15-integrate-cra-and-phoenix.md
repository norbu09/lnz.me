---
categories:
- articles
comments: false
date: 2018-08-15T00:00:00Z
description: How to integrate `create-react-app` with `phoenix` in a few simple steps
share: true
tags:
- post
- dev
title: CRA + Phoenix
url: /2018/08/15/integrate-cra-and-phoenix/
---

Working on some new projects and found myself again trying to find the best way
to integrate a JS frontend with a Phoenix app that renders the login page and
some static public pages and then redirects to a JS single page app for the
actual app. I have been there before but JS dependency management is hell and
I'd rather not go there so I tried out `create-react-app` which looks like a
nice way to get a working react app up and running quickly and maintainable.

To get CRA run:

  ```sh
  yarn create react-app
  ```

and add ~/.yarn/bin to your path. After that you can run `create-react-app [app
name]` anywhere on your system

In your phoenix project go into the directory that has your `assets` folder and remove it. Then run:

  ```sh
  create-react-app project-name
  mv project-name assets
  ```

This gives you a working CRA inside the Phoenix `assets` directory, victory!
I was happy till I stumbeled upon that little issue of marrying CRA to
Phoenix in a nice way for development that does not require me to eject the app
and loose the maintainability aspect of CRA. Turns out I am not the only one
that has this issues: https://github.com/facebook/create-react-app/issues/1070
But fortunately the solution is pretty simple: https://www.npmjs.com/package/cra-build-watch

To get `cra-build-watch` working change into your `assets` folder and run:

  ```sh
  yarn add -D cra-build-watch
  ```

add the `watch` step tp your `package.json`
  
  ```json
  {
    "scripts": {
      "watch": "cra-build-watch -b ../priv/static -p /[your-path-to-react-app]",
    }
  }
  ```

and configure your `config/dev.exs` to call the build-watcher you just added like this:

  ```elixir
  watchers: [
    yarn: [
      "run",
      "watch",
      cd: Path.expand("../assets", __DIR__)
    ]
  ] 
  ```

Finally have something like this in your template rendering your react app:

  ```html
    <div id="root"></div>
    <script type="text/javascript" src="<%= static_path(@conn, "/js/bundle.js") %>"></script>
  ```

Done. Next steps are making sure everything works nicely for production builds
as well and replace the template logic with a dynamic one that picks up the
right file name depending on the environment.

