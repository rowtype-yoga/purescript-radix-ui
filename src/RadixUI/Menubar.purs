module RadixUI.Menubar where

import Prelude
import React.Basic (ReactComponent)

foreign import menubarRoot :: forall a. ReactComponent { | a }
foreign import menubarMenu :: forall a. ReactComponent { | a }
foreign import menubarTrigger :: forall a. ReactComponent { | a }
foreign import menubarPortal :: forall a. ReactComponent { | a }
foreign import menubarContent :: forall a. ReactComponent { | a }
foreign import menubarLabel :: forall a. ReactComponent { | a }
foreign import menubarItem :: forall a. ReactComponent { | a }
foreign import menubarGroup :: forall a. ReactComponent { | a }
foreign import menubarCheckboxItem :: forall a. ReactComponent { | a }
foreign import menubarRadioGroup :: forall a. ReactComponent { | a }
foreign import menubarRadioItem :: forall a. ReactComponent { | a }
foreign import menubarSub :: forall a. ReactComponent { | a }
foreign import menubarSubTrigger :: forall a. ReactComponent { | a }
foreign import menubarSeparator :: forall a. ReactComponent { | a }
foreign import menubarArrow :: forall a. ReactComponent { | a }
foreign import menubarItemIndicator :: forall a. ReactComponent { | a }
