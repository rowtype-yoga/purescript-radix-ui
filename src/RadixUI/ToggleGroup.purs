module RadixUI.ToggleGroup where

import Prelude
import React.Basic (ReactComponent)

foreign import toggleGroupRoot :: forall a. ReactComponent { | a }
foreign import toggleGroupItem :: forall a. ReactComponent { | a }
