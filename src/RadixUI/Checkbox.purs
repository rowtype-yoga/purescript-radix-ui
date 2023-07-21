module RadixUI.Checkbox
  ( root
  , indicator
  ) where

import Prelude
import React.Basic (JSX, ReactComponent)
import Data.Undefined.NoProblem (Opt, pseudoMap)
import Effect (Effect)
import Type.Proxy (Proxy(Proxy))
import Effect.Uncurried (mkEffectFn1)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import React.Basic (element) as React
import Record.Builder (build, insert, modify) as RB

foreign import checkboxRootImpl :: forall a. ReactComponent { | a }
foreign import checkboxIndicatorImpl :: forall a. ReactComponent { | a }

type RootProps =
  { asChild :: Opt Boolean
  , defaultChecked :: Opt Boolean
  , checked :: Opt Boolean
  , onCheckedChange :: Opt (Boolean -> Effect Unit)
  , disabled :: Opt Boolean
  , required :: Opt Boolean
  , name :: Opt String
  , value :: Opt String
  }

root :: forall p. Coerce p RootProps => p -> Array JSX -> JSX
root props kids = React.element checkboxRootImpl
  $ (coerce props :: RootProps) # RB.build
      ( RB.modify (Proxy :: _ "onCheckedChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy :: _ "children") kids
      )

type IndicatorProps =
  { asChild :: Opt Boolean
  , forceMount :: Opt Boolean
  }

indicator :: forall p. Coerce p IndicatorProps => p -> JSX -> JSX
indicator props kid = React.element checkboxIndicatorImpl
  $ (coerce props :: IndicatorProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kid
      )
