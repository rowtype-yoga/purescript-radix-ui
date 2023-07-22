module RadixUI.Collapsible where

import Prelude
import React.Basic (JSX, ReactComponent)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (element) as React
import Effect (Effect)
import Type.Proxy (Proxy(Proxy))
import Data.Undefined.NoProblem (Opt, opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Record.Builder (build, insert, modify) as RB
import Beta.DOM.Internal (class IsJSX, CSS)

foreign import collapsibleRootImpl :: forall a. ReactComponent { | a }
foreign import collapsibleTriggerImpl :: forall a. ReactComponent { | a }
foreign import collapsibleContentImpl :: forall a. ReactComponent { | a }

type RootProps =
  { asChild :: Opt Boolean
  , className :: Opt String
  , style :: Opt CSS
  , defaultOpen :: Opt Boolean
  , open :: Opt Boolean
  , onOpenChange :: Opt (Boolean -> Effect Unit)
  , disabled :: Opt Boolean
  }

root :: forall p kids. IsJSX kids => Coerce p RootProps => p -> kids -> JSX
root props kids = React.element collapsibleRootImpl
  $ (coerce props :: RootProps) # RB.build
      ( RB.modify (Proxy :: _ "onOpenChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy :: _ "children") kids
      )

type TriggerProps =
  { asChild :: Opt Boolean
  }

trigger :: forall p kids. IsJSX kids => Coerce p TriggerProps => p -> kids -> JSX
trigger props kids = React.element collapsibleTriggerImpl
  $ (coerce props :: TriggerProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

type ContentProps =
  { asChild :: Opt Boolean
  , forceMount :: Opt Boolean
  }

content :: forall p kids. IsJSX kids => Coerce p ContentProps => p -> kids -> JSX
content props kids = React.element collapsibleContentImpl
  $ (coerce props :: ContentProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )
