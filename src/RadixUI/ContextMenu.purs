module RadixUI.ContextMenu where

import Prelude
import React.Basic (ReactComponent)

foreign import contextMenuRoot :: forall r. ReactComponent {|r}
foreign import contextMenuTrigger :: forall r. ReactComponent {|r}
foreign import contextMenuContent :: forall r. ReactComponent {|r}
foreign import contextMenuGroup :: forall r. ReactComponent {|r}
foreign import contextMenuItem :: forall r. ReactComponent {|r}
foreign import contextMenuCheckboxItem :: forall r. ReactComponent {|r}
foreign import contextMenuRadioGroup :: forall r. ReactComponent {|r}
foreign import contextMenuRadioItem :: forall r. ReactComponent {|r}
foreign import contextMenuSeparator :: forall r. ReactComponent {|r}
foreign import contextMenuArrow :: forall r. ReactComponent {|r}
foreign import contextMenuSub :: forall r. ReactComponent {|r}
foreign import contextMenuLabel :: forall r. ReactComponent {|r}
foreign import contextMenuSubTrigger :: forall r. ReactComponent {|r}
