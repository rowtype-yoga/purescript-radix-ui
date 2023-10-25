-- PureScript React Basic Hooks
module RadixUI.HoverCard where

import Prelude

import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import React.Basic (element) as React
import React.Basic.Events (EventHandler, SyntheticEvent)
import Record.Builder (build, insert, modify) as RB
import Record.Unsafe (unsafeSet)
import Record.Unsafe.Union (unsafeUnion)
import Type.Proxy (Proxy(Proxy))
import Data.Tuple.Nested ((/\))
import Control.Monad.Identity.Trans (runIdentityT)
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)

-- The type of the HoverCard component props
type RootProps =
  { open :: Opt Boolean -- ^ Whether the HoverCard is open or not
  , onOpenChange ::
      Opt (Boolean -> Effect Unit) -- ^ A callback function that is called when the HoverCard open state changes
  , className :: Opt String -- ^ The CSS class name of the HoverCard
  , style :: Opt CSS -- ^ The CSS style of the HoverCard
  }

-- The foreign component for the HoverCard
foreign import rootImpl :: forall a. ReactComponent { | a }

-- A PureScript wrapper for the HoverCard component
root :: forall p. Coerce p RootProps => p -> Array JSX -> JSX
root props kids = React.element rootImpl
  $ (coerce props :: RootProps) # RB.build
      ( RB.modify (Proxy :: _ "onOpenChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy :: _ "children") kids
      )

type HoverCardContentProps =
  { className :: Opt String -- ^ The CSS class name of the HoverCard content
  , style :: Opt CSS -- ^ The CSS style of the HoverCard content
  }

-- The foreign component for the HoverCardContent
foreign import contentImpl :: forall a. ReactComponent { | a }

-- A PureScript wrapper for the HoverCardContent component
content :: forall p kids. IsJSX kids => Coerce p HoverCardContentProps => p -> kids -> JSX
content props kids = React.element contentImpl
  $ (coerce props :: HoverCardContentProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- The type of the HoverCardTrigger component props
type HoverCardTriggerProps =
  { className :: Opt String -- ^ The CSS class name of the HoverCard trigger
  , style :: Opt CSS -- ^ The CSS style of the HoverCard trigger
  }

-- The foreign component for the HoverCardTrigger
foreign import triggerImpl :: forall a. ReactComponent { | a }

-- A PureScript wrapper for the HoverCardTrigger component
trigger ::
  forall p kids. Coerce p HoverCardTriggerProps => IsJSX kids => p -> kids -> JSX
trigger props kids = React.element triggerImpl
  $ (coerce props :: HoverCardTriggerProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- The type of the arrow component props
type HoverCardArrowProps =
  { className :: Opt String -- ^ The CSS class name of the HoverCard arrow
  , style :: Opt CSS -- ^ The CSS style of the HoverCard arrow
  }

-- The foreign component for the HoverCard arrow
foreign import arrowImpl :: forall a. ReactComponent { | a }

-- A PureScript wrapper for the HoverCard arrow component
arrow ∷ ∀ p kids. IsJSX kids => Coerce p HoverCardArrowProps ⇒ p → kids -> JSX
arrow props kids = React.element arrowImpl
  $ (coerce props ∷ HoverCardArrowProps) # RB.build
      ( RB.insert (Proxy :: Proxy "children") kids)

-- The type of the portal component props
type HoverCardPortalProps =
  {}

-- The foreign component for the HoverCard portal
foreign import portalImpl :: forall a. ReactComponent { | a }

-- A PureScript wrapper for the HoverCardPortal component
portal ::
  forall p kids. Coerce p HoverCardPortalProps => IsJSX kids => p -> kids -> JSX
portal props kids = React.element portalImpl
  $ (coerce props :: HoverCardPortalProps) #
      unsafeSet "children" kids