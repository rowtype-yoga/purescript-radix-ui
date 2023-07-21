module RadixUI.Accordion where

import Prelude
import React.Basic (JSX, ReactComponent, Ref)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (element) as React
import Effect (Effect)
import Type.Proxy (Proxy(Proxy))
import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Record.Builder (build, insert, modify) as RB
import Data.Nullable (Nullable)
import Web.DOM.Internal.Types (Node)
import Beta.DOM.Internal (CSS)

foreign import accordionRootImpl ∷ ∀ a. ReactComponent { | a }
foreign import accordionItemImpl ∷ ∀ a. ReactComponent { | a }
foreign import accordionHeaderImpl ∷ ∀ a. ReactComponent { | a }
foreign import accordionTriggerImpl ∷ ∀ a. ReactComponent { | a }
foreign import accordionContentImpl ∷ ∀ a. ReactComponent { | a }

data AccordionType = Single | Multiple

type RootProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , type ∷ Opt AccordionType
  , value ∷ Opt String
  , defaultValue ∷ Opt String
  , onValueChange ∷ Opt (String → Effect Unit)
  , values ∷ Opt (Array String)
  , defaultValues ∷ Opt (Array String)
  , collapsible ∷ Opt Boolean
  , disabled ∷ Opt Boolean
  , dir ∷ Opt String
  , orientation ∷ Opt String
  }

root ∷ ∀ p. Coerce p RootProps ⇒ p → Array JSX → JSX
root props kids = React.element accordionRootImpl
  $ (coerce props ∷ RootProps) # RB.build
      ( RB.modify (Proxy ∷ _ "onValueChange") (pseudoMap mkEffectFn1)
          <<< RB.modify (Proxy ∷ _ "type")
            ( pseudoMap case _ of
                Single → "single"
                Multiple → "multiple"
            )
          <<< RB.insert (Proxy ∷ _ "children") kids
      )

type ItemProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , disabled ∷ Opt Boolean
  , value ∷ Opt String
  , ref ∷ Opt (Ref (Nullable Node))
  }

item ∷ ∀ p. Coerce p ItemProps ⇒ p → Array JSX → JSX
item props kid = React.element accordionItemImpl
  $ (coerce props ∷ ItemProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kid
      )

type HeaderProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  }

header ∷ ∀ p. Coerce p HeaderProps ⇒ p → JSX → JSX
header props kid = React.element accordionHeaderImpl
  $ (coerce props ∷ HeaderProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kid
      )

type TriggerProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , ref ∷ Opt (Ref (Nullable Node))
  }

trigger ∷ ∀ p. Coerce p TriggerProps ⇒ p → Array JSX → JSX
trigger props kids = React.element accordionTriggerImpl
  $ (coerce props ∷ TriggerProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kids
      )

type ContentProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , forceMount ∷ Opt Boolean
  , ref ∷ Opt (Ref (Nullable Node))
  }

content ∷ ∀ p. Coerce p ContentProps ⇒ p → JSX → JSX
content props kid = React.element accordionContentImpl
  $ (coerce props ∷ ContentProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kid
      )
