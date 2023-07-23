module RadixUI.Dialog where

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

-- | The type of the Dialog component props
type RootProps =
  { open ∷ Opt Boolean -- ^ Whether the alert dialog is open or not
  , onOpenChange ∷
      Opt (Boolean → Effect Unit) -- ^ A callback function that is called when the alert dialog open state changes
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog
  }

x = React.element

-- | The foreign component for the Dialog
foreign import rootImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the Dialog component
root
  ∷ ∀ p
  . Coerce p RootProps
  ⇒ p
  → Array JSX
  → JSX
root props kids = React.element rootImpl $
  (coerce props ∷ RootProps) # RB.build
    ( RB.modify (Proxy ∷ _ "onOpenChange") (pseudoMap mkEffectFn1)
        <<< RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogTrigger component props
type DialogTriggerProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog trigger as a child of the dialog content
  }

-- | The foreign component for the DialogTrigger
foreign import triggerImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogTrigger component
trigger
  ∷ ∀ p kids. Coerce p DialogTriggerProps ⇒ IsJSX kids ⇒ p → kids → JSX
trigger props kids = React.element triggerImpl $
  (coerce props ∷ DialogTriggerProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogPortal component props
type DialogPortalProps =
  { forceMount ∷ Opt Boolean -- ^ Whether to force mount the alert dialog portal in the DOM even when it is not open
  , container ∷ Opt HTMLElement -- ^ The container element to mount the alert dialog portal into
  }

-- | The foreign component for the DialogPortal
foreign import portalImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogPortal component
portal
  ∷ ∀ p kids. Coerce p DialogPortalProps ⇒ IsJSX kids ⇒ p → kids → JSX
portal props kids = React.element portalImpl $
  (coerce props ∷ DialogPortalProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogOverlay component props
type DialogOverlayProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog overlay as a child of the dialog content
  , forceMount ∷
      Opt Boolean -- ^ Whether to force mount the alert dialog overlay in the DOM even when it is not open
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog overlay
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog overlay
  }

-- | The foreign component for the DialogOverlay
foreign import overlayImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogOverlay component
overlay
  ∷ ∀ p kids. Coerce p DialogOverlayProps ⇒ IsJSX kids ⇒ p → kids → JSX
overlay props kids = React.element overlayImpl $
  (coerce props ∷ DialogOverlayProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogContent component props
type DialogContentProps =
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

-- | The foreign component for the DialogContent
foreign import contentImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogContent component
content
  ∷ ∀ p kids. Coerce p DialogContentProps ⇒ IsJSX kids ⇒ p → kids → JSX
content props kids = React.element contentImpl $
  (coerce props ∷ DialogContentProps) # RB.build
    (
      --    RB.modify (Proxy :: _ "onOpenAutoFocus") (pseudoMap mkEffectFn1)
      --        <<< RB.modify (Proxy :: _ "onCloseAutoFocus") (pseudoMap mkEffectFn1)
      --        <<< RB.modify (Proxy :: _ "onEscapeKeyDown") (pseudoMap mkEffectFn1)
      --        <<<
      RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogCancel component props
type DialogCancelProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog cancel button as a child of the dialog content
  }

-- | The type of the DialogTitle component props
type DialogTitleProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog title as a child of the dialog content
  , className ∷ Opt String -- ^ The CSS class name of the alert dialog title
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog title
  }

-- | The foreign component for the DialogTitle
foreign import titleImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogTitle component
title
  ∷ ∀ p kids. Coerce p DialogTitleProps ⇒ IsJSX kids ⇒ p → kids → JSX
title props kids = React.element titleImpl $
  (coerce props ∷ DialogTitleProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogDescription component props
type DialogDescriptionProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog description as a child of the dialog content
  , className ∷
      Opt String -- ^ The CSS class name of the alert dialog description
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog description
  }

-- | The foreign component for the DialogDescription
foreign import descriptionImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogDescription component
description
  ∷ ∀ p kids. Coerce p DialogDescriptionProps ⇒ IsJSX kids ⇒ p → kids → JSX
description props kids = React.element descriptionImpl $
  (coerce props ∷ DialogDescriptionProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )

-- | The type of the DialogClose component props
type DialogCloseProps =
  { asChild ∷
      Opt Boolean -- ^ Whether to render the alert dialog description as a child of the dialog content
  , className ∷
      Opt String -- ^ The CSS class name of the alert dialog description
  , style ∷ Opt CSS -- ^ The CSS style of the alert dialog description
  }

-- | The foreign component for the DialogClose
foreign import closeImpl ∷ ∀ a. ReactComponent { | a }

-- | A PureScript wrapper for the DialogClose component
close
  ∷ ∀ p kids. Coerce p DialogCloseProps ⇒ IsJSX kids ⇒ p → kids → JSX
close props kids = React.element closeImpl $
  (coerce props ∷ DialogCloseProps) # RB.build
    ( RB.insert (Proxy ∷ _ "children") kids
    )
