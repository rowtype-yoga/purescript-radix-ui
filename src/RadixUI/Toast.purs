module RadixUI.Toast where

import Prelude
import React.Basic (ReactComponent)

foreign import toastRoot :: forall a. ReactComponent { | a }
foreign import toastTitle :: forall a. ReactComponent { | a }
foreign import toastDescription :: forall a. ReactComponent { | a }
foreign import toastAction :: forall a. ReactComponent { | a }
foreign import toastClose :: forall a. ReactComponent { | a }
foreign import toastViewport :: forall a. ReactComponent { | a }


--export const toastRoot = Toast.Root;
--export const toastTitle = Toast.Title;
--export const toastDescription = Toast.Description;
--export const toastAction = Toast.Action;
--export const toastClose = Toast.Close;
--export const toastViewport = Toast.Viewport;
