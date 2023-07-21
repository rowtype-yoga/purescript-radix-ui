module RadixUI.RadioGroup where

import Prelude

import React.Basic (ReactComponent)

foreign import radioGroupRoot :: forall a. ReactComponent { | a }
foreign import radioGroupItem :: forall a. ReactComponent { | a }
foreign import radioGroupIndicator :: forall a. ReactComponent { | a }
