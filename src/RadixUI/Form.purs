module RadixUI.Form where

import Prelude
import React.Basic (ReactComponent)

foreign import formRoot :: forall r. ReactComponent {|r}
foreign import formField :: forall r. ReactComponent {|r}
foreign import formLabel :: forall r. ReactComponent {|r}
foreign import formControl :: forall r. ReactComponent {|r}
foreign import formMessage :: forall r. ReactComponent {|r}
foreign import formValidityState :: forall r. ReactComponent {|r}
foreign import formSubmit :: forall r. ReactComponent {|r}
