module RadixUI.Popover where

import Prelude

import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)
import Record.Unsafe.Union (unsafeUnion)
import Type.Proxy (Proxy(Proxy))
import Web.DOM.Internal.Types (Element)
import Web.HTML.HTMLElement (HTMLElement)
import Record.Builder (build, insert, modify) as RB
import React.Basic (element) as React

-- Root
type RootProps =
  { defaultOpen ∷ Opt Boolean
  , open ∷ Opt Boolean
  , onOpenChange ∷ Opt (Boolean → Effect Unit)
  , modal ∷ Opt Boolean
  }

foreign import rootImpl ∷ ∀ a. ReactComponent { | a }

root ∷ ∀ p kids. Coerce p RootProps ⇒ IsJSX kids ⇒ p → kids → JSX
root props kids = React.element rootImpl
  $ (coerce props ∷ RootProps) # RB.build
      ( RB.modify (Proxy ∷ _ "onOpenChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy ∷ _ "children") kids
      )

-- Trigger
type TriggerProps =
  { asChild ∷ Opt Boolean
  }

foreign import triggerImpl ∷ ∀ a. ReactComponent { | a }

trigger ∷ ∀ p kids. Coerce p TriggerProps ⇒ IsJSX kids ⇒ p → kids → JSX
trigger props kids = React.element triggerImpl
  $ (coerce props ∷ TriggerProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kids
      )

-- Anchor
type AnchorProps =
  { asChild ∷ Opt Boolean
  }

foreign import anchorImpl ∷ ∀ a. ReactComponent { | a }

anchor ∷ ∀ p kids. Coerce p AnchorProps ⇒ p → kids → JSX
anchor props kids = React.element anchorImpl
  $ (coerce props ∷ AnchorProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kids
      )

-- Portal
type PortalProps =
  { forceMount ∷ Opt Boolean
  , container ∷ Opt HTMLElement
  }

foreign import portalImpl ∷ ∀ a. ReactComponent { | a }

portal ∷ ∀ p kids. Coerce p PortalProps ⇒ IsJSX kids ⇒ p → kids → JSX
portal props kids = React.element portalImpl
  $ (coerce props ∷ PortalProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") kids
      )

data PopoverSide = Top | Right | Bottom | Left
data Align = AlignStart | AlignCenter | AlignEnd
data Sticky = Always | Partial
-- Content
type ContentProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , onOpenAutoFocus ∷ Opt (Effect Unit)
  , onCloseAutoFocus ∷ Opt (Effect Unit)
  , onEscapeKeyDown ∷ Opt (Effect Unit)
  , onPointerDownOutside ∷ Opt (Effect Unit)
  , onFocusOutside ∷ Opt (Effect Unit)
  , onInteractOutside ∷ Opt (Effect Unit)
  , forceMount ∷ Opt Boolean
  , side ∷ Opt PopoverSide
  , sideOffset ∷ Opt Number
  , align ∷ Opt Align
  , alignOffset ∷ Opt Number
  , avoidCollisions ∷ Opt Boolean
  , collisionBoundary ∷ Opt (Array Element)
  , collisionPadding ∷ Opt Number
  , arrowPadding ∷ Opt Number
  , sticky ∷ Opt Sticky
  , hideWhenDetached ∷ Opt Boolean
  }

foreign import contentImpl ∷ ∀ a. ReactComponent { | a }

content ∷ ∀ p kids. Coerce p ContentProps ⇒ IsJSX kids ⇒ p → kids → JSX
content props' children = do
  let props = coerce props' ∷ ContentProps
  React.element contentImpl $ props # unsafeUnion
    { children
    , side: props.side # pseudoMap case _ of
        Top → "top"
        Right → "right"
        Bottom → "bottom"
        Left → "left"
    , align: props.align # pseudoMap case _ of
        AlignStart → "start"
        AlignCenter → "center"
        AlignEnd → "end"
    , sticky: props.sticky # pseudoMap case _ of
        Always → "always"
        Partial → "partial"
    }

-- Arrow
type ArrowProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , width ∷ Opt Number
  , height ∷ Opt Number
  }

foreign import arrowImpl ∷ ∀ a. ReactComponent { | a }

arrow ∷ ∀ p. Coerce p ArrowProps ⇒ p → JSX
arrow props = React.element arrowImpl
  $ (coerce props ∷ ArrowProps)

-- Close
type CloseProps =
  { asChild ∷ Opt Boolean
  , className ∷ Opt String
  , style ∷ Opt CSS
  , "aria-label" ∷ Opt String
  }

foreign import closeImpl ∷ ∀ a. ReactComponent { | a }

close ∷ ∀ p kids. Coerce p CloseProps ⇒ p → kids → JSX
close props children = React.element closeImpl
  $ (coerce props ∷ CloseProps) # RB.build
      ( RB.insert (Proxy ∷ _ "children") children
      )
