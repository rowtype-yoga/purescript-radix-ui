module RadixUI.Tabs where

import Prelude
import React.Basic (ReactComponent)

foreign import tabsRoot :: forall a. ReactComponent { | a }
foreign import tabsList :: forall a. ReactComponent { | a }
foreign import tabsTrigger :: forall a. ReactComponent { | a }
foreign import tabsContent :: forall a. ReactComponent { | a }

--export const tabsRoot = Tabs.Root;
--export const tabsList = Tabs.List;
--export const tabsTrigger = Tabs.Trigger;
--export const tabsContent = Tabs.Content;
