module RadixUI.ScrollArea where

import Prelude
import React.Basic (ReactComponent)

foreign import scrollAreaRoot :: forall a. ReactComponent { | a }
foreign import scrollAreaViewport :: forall a. ReactComponent { | a }
foreign import scrollAreaScrollbar :: forall a. ReactComponent { | a }
foreign import scrollAreaThumb :: forall a. ReactComponent { | a }
foreign import scrollAreaCorner :: forall a. ReactComponent { | a }


--export const scrollAreaRoot = ScrollArea.Root;
--export const scrollAreaViewport = ScrollArea.Viewport;
--export const scrollAreaScrollbar = ScrollArea.Scrollbar;
--export const scrollAreaThumb = ScrollArea.Thumb;
--export const scrollAreaCorner = ScrollArea.Corner;
