module RadixUI.Tooltip where

import Prelude

import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import React.Basic (element) as React
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)
import Record.Builder (build, insert, modify) as RB
import Record.Unsafe (unsafeSet)
import Record.Unsafe.Union (unsafeUnion)
import Type.Proxy (Proxy(Proxy))
import Web.DOM.Internal.Types (Element)
import Web.HTML.HTMLElement (HTMLElement)

-- Provider
type ProviderProps =
  { delayDuration :: Opt Number
  , skipDelayDuration :: Opt Number
  , disableHoverableContent :: Opt Boolean
  }

foreign import providerImpl :: forall a. ReactComponent { | a }

provider :: forall p kids. Coerce p ProviderProps => IsJSX kids => p -> kids -> JSX
provider props kids = do
  React.element providerImpl
    $ (coerce props :: ProviderProps) # unsafeSet "children" kids

-- Root
type RootProps =
  { defaultOpen :: Opt Boolean
  , open :: Opt Boolean
  , onOpenChange :: Opt (Boolean -> Effect Unit)
  , delayDuration :: Opt Number
  , disableHoverableContent :: Opt Boolean
  }

foreign import rootImpl :: forall a. ReactComponent { | a }

root :: forall p kids. Coerce p RootProps => IsJSX kids => p -> kids -> JSX
root props' kids = do
  let props = coerce props' :: RootProps
  React.element rootImpl $ props # unsafeUnion
    { children: kids
    , onOpenChange: props.onOpenChange # pseudoMap mkEffectFn1
    }

-- Trigger
type TriggerProps =
  { asChild :: Opt Boolean
  }

foreign import triggerImpl :: forall a. ReactComponent { | a }

trigger :: forall p kids. Coerce p TriggerProps => IsJSX kids => p -> kids -> JSX
trigger props kids = React.element triggerImpl
  ( (coerce props :: TriggerProps)
      # unsafeSet "children" kids
  )

-- Portal
type PortalProps =
  { forceMount :: Opt Boolean
  , container :: Opt HTMLElement
  }

foreign import portalImpl :: forall a. ReactComponent { | a }

portal :: forall p kids. Coerce p PortalProps => IsJSX kids => p -> kids -> JSX
portal props kids = React.element portalImpl
  $ (coerce props :: PortalProps) # RB.build
      ( RB.insert (Proxy :: Proxy "children") kids
      )

-- Content
type ContentProps =
  { asChild :: Opt Boolean
  , className :: Opt String
  , style :: Opt CSS
  , ariaLabel :: Opt String
  , onEscapeKeyDown :: Opt (Effect Unit)
  , onPointerDownOutside :: Opt (Effect Unit)
  , forceMount :: Opt Boolean
  , side :: Opt TooltipSide
  , sideOffset :: Opt Number
  , align :: Opt TooltipAlign
  , alignOffset :: Opt Number
  , avoidCollisions :: Opt Boolean
  , collisionBoundary :: Opt (Array Element)
  , collisionPadding :: Opt Number
  , arrowPadding :: Opt Number
  , sticky :: Opt TooltipSticky
  , hideWhenDetached :: Opt Boolean
  }

foreign import contentImpl :: forall a. ReactComponent { | a }

data TooltipSide = Top | Right | Bottom | Left
data TooltipAlign = AlignStart | AlignCenter | AlignEnd
data TooltipSticky = Always | Partial

content :: forall p kids. Coerce p ContentProps => IsJSX kids => p -> kids -> JSX
content props' children = do
  let props = coerce props' :: ContentProps
  React.element contentImpl $ props # unsafeUnion
    { children
    , side: props.side # pseudoMap case _ of
        Top -> "top"
        Right -> "right"
        Bottom -> "bottom"
        Left -> "left"
    , align: props.align # pseudoMap case _ of
        AlignStart -> "start"
        AlignCenter -> "center"
        AlignEnd -> "end"
    , sticky: props.sticky # pseudoMap case _ of
        Always -> "always"
        Partial -> "partial"
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

arrow ∷ ∀ p kids. IsJSX kids => Coerce p ArrowProps ⇒ p → kids -> JSX
arrow props kids = React.element arrowImpl
  $ (coerce props ∷ ArrowProps)# RB.build
      ( RB.insert (Proxy :: Proxy "children") kids)

