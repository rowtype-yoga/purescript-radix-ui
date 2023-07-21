module RadixUI.Switch where

import Prelude
import React.Basic (ReactComponent)

foreign import switchRoot :: forall a. ReactComponent { | a }
foreign import switchThumb :: forall a. ReactComponent { | a }
