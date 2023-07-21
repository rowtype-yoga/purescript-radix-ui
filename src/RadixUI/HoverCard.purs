-- PureScript React Basic Hooks
module RadixUI.HoverCard where

import Prelude
import React.Basic (ReactComponent)

foreign import hoverCardRoot :: forall r. ReactComponent { | r }
foreign import hoverCardTrigger :: forall r. ReactComponent { | r }
foreign import hoverCardContent :: forall r. ReactComponent { | r }
foreign import hoverCardArrow :: forall r. ReactComponent { | r }
foreign import hoverCardPortal :: forall r. ReactComponent { | r }
