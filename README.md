# PureScript Radix UI

Use this library

add this to your `packages.dhall`
```dhall
with react-basic-dom-beta =
      { dependencies =
          [ "datetime"
          , "effect"
          , "forgetmenot"
          , "functions"
          , "nullable"
          , "prelude"
          , "react-basic"
          , "react-basic-hooks"
          , "record"
          , "type-equality"
          , "typelevel-prelude"
          , "unsafe-coerce"
          , "web-dom"
          , "web-events"
          , "web-html"
          , "web-touchevents"
          ]
      , repo =
          "https://github.com/rowtype-yoga/purescript-react-basic-dom-beta.git"
      , version = "main"
      }  

with radix-ui =
    { dependencies =
          [ "datetime"
          , "effect"
          , "newtype"
          , "nullable"
          , "partial"
          , "prelude"
          , "react-basic"
          , "react-basic-dom-beta"
          , "record"
          , "transformers"
          , "tuples"
          , "undefined-is-not-a-problem"
          , "web-dom"
          , "web-html"
          ]
      , repo = 
          "https://github.com/rowtype-yoga/purescript-radix-ui.git" 
        , version = "main"
```