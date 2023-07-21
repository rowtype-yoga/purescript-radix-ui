module RadixUI.Toolbar where

import Prelude
import React.Basic (ReactComponent)
import Data.Newtype (class Newtype)

foreign import toolbarRoot :: forall a. ReactComponent { | a }
foreign import toolbarButton :: forall a. ReactComponent { | a }
foreign import toolbarSeparator :: forall a. ReactComponent { | a }
foreign import toolbarLink :: forall a. ReactComponent { | a }
foreign import toolbarToggleGroup :: forall a. ReactComponent { | a }
foreign import toolbarToggleItem :: forall a. ReactComponent { | a }
