module RadixUI.Slider where

import Prelude
import React.Basic (ReactComponent)

foreign import sliderRoot :: forall a. ReactComponent { | a }
foreign import sliderTrack :: forall a. ReactComponent { | a }
foreign import sliderRange :: forall a. ReactComponent { | a }
foreign import sliderThumb :: forall a. ReactComponent { | a }