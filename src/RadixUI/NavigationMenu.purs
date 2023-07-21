module RadixUI.NavigationMenu where

import Prelude
import React.Basic (JSX, ReactComponent)
import Effect.Uncurried (EffectFn1)
import Prim.Row (class Union)
import React.Basic (element) as React
import Effect (Effect)
import Type.Proxy (Proxy(Proxy))
import Data.Undefined.NoProblem (Opt)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Record.Builder (build, insert) as RB
import Beta.DOM.Internal (CSS)
import React.Basic.Events (SyntheticEvent)
import Beta.DOM (class IsJSX)

foreign import navigationMenuRootImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuSubImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuListImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuItemImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuTriggerImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuContentImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuLinkImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuIndicatorImpl ∷ ∀ a. ReactComponent { | a }
foreign import navigationMenuViewportImpl ∷ ∀ a. ReactComponent { | a }

type RootProps =
  { defaultValue ∷ Opt String
  , value ∷ Opt String
  , onValueChange ∷ Opt (String → Effect Unit)
  , delayDuration ∷ Opt Number
  , skipDelayDuration ∷ Opt Number
  , dir ∷ Opt String
  , orientation ∷ Opt String
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

root ∷ ∀ p. Coerce p RootProps ⇒ p → Array JSX → JSX
root props children = React.element navigationMenuRootImpl
  $ (coerce props ∷ RootProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type SubProps =
  { defaultValue ∷ Opt String
  , value ∷ Opt String
  , onValueChange ∷ Opt (String → Effect Unit)
  , orientation ∷ Opt String
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

sub ∷ ∀ p. Coerce p SubProps ⇒ p → Array JSX → JSX
sub props children = React.element navigationMenuSubImpl
  $ (coerce props ∷ SubProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type ListProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

list ∷ ∀ p kids. Coerce p ListProps ⇒ IsJSX kids => p → kids → JSX
list props children = React.element navigationMenuListImpl
  $ (coerce props ∷ ListProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type ItemProps =
  { asChild ∷ Opt Boolean
  , value ∷ Opt String
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

item ∷ ∀ p kids. IsJSX kids => Coerce p ItemProps ⇒ p → kids → JSX
item props children = React.element navigationMenuItemImpl
  $ (coerce props ∷ ItemProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type TriggerProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

trigger ∷ ∀ p. Coerce p TriggerProps ⇒ p → Array JSX → JSX
trigger props children = React.element navigationMenuTriggerImpl
  $ (coerce props ∷ TriggerProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type ContentProps =
  { asChild ∷ Opt Boolean
  , disableOutsidePointerEvents ∷ Opt Boolean
  , onEscapeKeyDown ∷ Opt (EffectFn1 SyntheticEvent Unit)
  , onPointerDownOutside ∷ Opt (EffectFn1 SyntheticEvent Unit)
  , onFocusOutside ∷ Opt (EffectFn1 SyntheticEvent Unit)
  , onInteractOutside ∷ Opt (EffectFn1 SyntheticEvent Unit)
  , forceMount ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

content ∷ ∀ p. Coerce p ContentProps ⇒ p → Array JSX → JSX
content props children = React.element navigationMenuContentImpl
  $ (coerce props ∷ ContentProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type LinkProps =
  { asChild ∷ Opt Boolean
  , active ∷ Opt Boolean
  , onSelect ∷ Opt (EffectFn1 SyntheticEvent Unit)
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

link ∷ ∀ p kids. Coerce p LinkProps => IsJSX kids ⇒ p → kids → JSX
link props children = React.element navigationMenuLinkImpl
  $ (coerce props ∷ LinkProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type IndicatorProps =
  { asChild ∷ Opt Boolean
  , forceMount ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

indicator ∷ ∀ p. Coerce p IndicatorProps ⇒ p → Array JSX → JSX
indicator props children = React.element navigationMenuIndicatorImpl
  $ (coerce props ∷ IndicatorProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )

type ViewportProps =
  { asChild ∷ Opt Boolean
  , forceMount ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  }

viewport ∷ ∀ p. Coerce p ViewportProps ⇒ p → JSX
viewport props = React.element navigationMenuViewportImpl
  $ (coerce props ∷ ViewportProps)
