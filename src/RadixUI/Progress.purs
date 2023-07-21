module RadixUI.Progress where

import Prelude
import React.Basic (ReactComponent)

foreign import progressRoot :: forall a. ReactComponent { | a }
foreign import progressIndicator :: forall a. ReactComponent { | a }

