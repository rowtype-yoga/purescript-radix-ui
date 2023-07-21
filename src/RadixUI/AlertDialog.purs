module RadixUI.AlertDialog where

import Prelude
import React.Basic (JSX, ReactComponent)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (element) as React
import Effect (Effect)
import Type.Proxy (Proxy(Proxy))
import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Record.Builder (build, insert, modify) as RB
import React.Basic.Events (SyntheticEvent)
import Web.HTML.HTMLElement (HTMLElement)
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)

-- | The type of the AlertDialog component props
type RootProps =
  { open ∷ Opt Boolean -- ^ Whether the alert dialog is open or not
  , onOpenChange ∷
      Opt (Boolean → Effect Unit) -- ^ A callback function that is called when the alert dialog open state changes
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog
  }

x = React.element
-- | The foreign component for the AlertDialog
foreign import rootImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialog component
root ∷
  ∀ p.
  Coerce p RootProps ⇒
  p →
  Array JSX →
  JSX
root props kids = React.element rootImpl $
  (coerce props ∷ RootProps) # RB.build
    ( RB.modify (Proxy ∷ _ "onOpenChange") (pseudoMap mkEffectFn1)
        <<< RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogTrigger component props
type AlertDialogTriggerProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog trigger as a child of the dialog content
  }

-- | The foreign component for the AlertDialogTrigger
foreign import triggerImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogTrigger component
trigger ∷
  ∀ p kids. Coerce p AlertDialogTriggerProps ⇒ IsJSX kids ⇒ p → kids → JSX
trigger props kids = React.element triggerImpl $
  (coerce props ∷ AlertDialogTriggerProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogPortal component props
type AlertDialogPortalProps =
  { forceMount ∷
      Opt Boolean -- ^ Whether to force mount the alert dialog portal in the DOM even when it is not open
  , container ∷
      Opt HTMLElement -- ^ The container element to mount the alert dialog portal into
  }

-- | The foreign component for the AlertDialogPortal
foreign import portalImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogPortal component
portal ∷
  ∀ p kids. Coerce p AlertDialogPortalProps ⇒ IsJSX kids ⇒ p → kids → JSX
portal props kids = React.element portalImpl $
  (coerce props ∷ AlertDialogPortalProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogOverlay component props
type AlertDialogOverlayProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog overlay as a child of the dialog content
  , forceMount ∷
      Opt Boolean -- ^ Whether to force mount the alert dialog overlay in the DOM even when it is not open
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog overlay
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog overlay
  }

-- | The foreign component for the AlertDialogOverlay
foreign import overlayImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogOverlay component
overlay ∷
  ∀ p kids. Coerce p AlertDialogOverlayProps ⇒ IsJSX kids ⇒ p → kids → JSX
overlay props kids = React.element overlayImpl $
  (coerce props ∷ AlertDialogOverlayProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogContent component props
type AlertDialogContentProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog content as a child of the dialog root
  , forceMount ∷
      Opt Boolean -- ^ Whether to force mount the alert dialog content in the DOM even when it is not open
  , onOpenAutoFocus ∷
      Opt (Effect Unit) -- ^ A callback function that is called when the alert dialog content is opened and should receive focus
  , onCloseAutoFocus ∷
      Opt (Effect Unit) -- ^ A callback function that is called when the alert dialog content is closed and should receive focus
  , onEscapeKeyDown ∷
      Opt (Effect Unit) -- ^ A callback function that is called when the escape key is pressed while the alert dialog content is focused
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog content
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog content
  }

-- | The foreign component for the AlertDialogContent
foreign import contentImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogContent component
content ∷
  ∀ p kids. Coerce p AlertDialogContentProps ⇒ IsJSX kids ⇒ p → kids → JSX
content props kids = React.element contentImpl $
  (coerce props ∷ AlertDialogContentProps) # RB.build
    (
      --    RB.modify (Proxy :: _ "onOpenAutoFocus") (pseudoMap mkEffectFn1)
      --        <<< RB.modify (Proxy :: _ "onCloseAutoFocus") (pseudoMap mkEffectFn1)
      --        <<< RB.modify (Proxy :: _ "onEscapeKeyDown") (pseudoMap mkEffectFn1)
      --        <<<
      RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogCancel component props
type AlertDialogCancelProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog cancel button as a child of the dialog content
  }

-- | The foreign component for the AlertDialogCancel
foreign import cancelImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogCancel component
cancel ∷
  ∀ p kids. Coerce p AlertDialogCancelProps ⇒ IsJSX kids ⇒ p → kids → JSX
cancel props kids = React.element cancelImpl $
  (coerce props ∷ AlertDialogCancelProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogAction component props
type AlertDialogActionProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog action button as a child of the dialog content
  }

-- | The foreign component for the AlertDialogAction
foreign import actionImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogAction component
action ∷
  ∀ p kids. Coerce p AlertDialogActionProps ⇒ IsJSX kids ⇒ p → kids → JSX
action props kids = React.element actionImpl $
  (coerce props ∷ AlertDialogActionProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogTitle component props
type AlertDialogTitleProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog title as a child of the dialog content
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog title
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog title
  }

-- | The foreign component for the AlertDialogTitle
foreign import titleImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogTitle component
title ∷
  ∀ p kids. Coerce p AlertDialogTitleProps ⇒ IsJSX kids ⇒ p → kids → JSX
title props kids = React.element titleImpl $
  (coerce props ∷ AlertDialogTitleProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the AlertDialogDescription component props
type AlertDialogDescriptionProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog description as a child of the dialog content
  , className ∷
      Opt String -- ^ The CSS class name of the alert dialog description
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog description
  }

-- | The foreign component for the AlertDialogDescription
foreign import descriptionImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the AlertDialogDescription component
description ∷
  ∀ p kids. Coerce p AlertDialogDescriptionProps ⇒ IsJSX kids ⇒ p → kids → JSX
description props kids = React.element descriptionImpl $
  (coerce props ∷ AlertDialogDescriptionProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

