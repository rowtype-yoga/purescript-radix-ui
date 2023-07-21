module RadixUI.Dialog where

import Prelude
import React.Basic (ReactComponent)

foreign import dialogOverlay :: forall r. ReactComponent {|r}
foreign import dialogContent :: forall r. ReactComponent {|r}
foreign import dialogTitle :: forall r. ReactComponent {|r}
foreign import dialogDescription :: forall r. ReactComponent {|r}
foreign import dialogTrigger :: forall r. ReactComponent {|r}
foreign import dialogClose :: forall r. ReactComponent {|r}
foreign import dialogRoot :: forall r. ReactComponent {|r}

