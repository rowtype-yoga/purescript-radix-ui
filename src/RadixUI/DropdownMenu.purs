module RadixUI.DropdownMenu where

import Prelude

import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import React.Basic (element) as React
import React.Basic.Events (EventHandler, SyntheticEvent)
import Record.Builder (build, insert, modify) as RB
import Record.Unsafe (unsafeSet)
import Record.Unsafe.Union (unsafeUnion)
import Type.Proxy (Proxy(Proxy))
import Data.Tuple.Nested ((/\))
import Control.Monad.Identity.Trans (runIdentityT)
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)


-- | The type of the DropdownMenu component props
type RootProps =
  { open :: Opt Boolean -- ^ Whether the menu is open or not
  , onOpenChange ::
      Opt (Boolean -> Effect Unit) -- ^ A callback function that is called when the menu open state changes
  , className :: Opt String -- ^ The CSS class name of the menu
  , style :: Opt CSS -- ^ The CSS style of the menu
  }

-- | The foreign component for the DropdownMenu
foreign import rootImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenu component
root :: forall p. Coerce p RootProps => p -> Array JSX -> JSX
root props kids = React.element rootImpl
  $ (coerce props :: RootProps) # RB.build
      ( RB.modify (Proxy :: _ "onOpenChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuContent component props
type DropdownMenuContentProps =
  { side ::
      Opt String -- ^ The preferred side of the menu content relative to the trigger
  , sideOffset ::
      Opt Number -- ^ The offset in pixels from the trigger to the menu content on the side axis
  , align ::
      Opt String -- ^ The preferred alignment of the menu content relative to the trigger on the side axis
  , alignOffset ::
      Opt Number -- ^ The offset in pixels from the trigger to the menu content on the align axis
  , disableOutsidePointerEvents ::
      Opt Boolean -- ^ Whether to disable pointer events outside of the menu content
  , onEscapeKeyDown ::
      Opt (Effect Unit) -- ^ A callback function that is called when the escape key is pressed while the menu content is focused
  , onPointerDownOutside ::
      Opt (Effect Unit) -- ^ A callback function that is called when a pointer event occurs outside of the menu content
  , onFocusOutside ::
      Opt (Effect Unit) -- ^ A callback function that is called when a focus event occurs outside of the menu content
  , onInteractOutside ::
      Opt (Effect Unit) -- ^ A callback function that is called when an interaction event occurs outside of the menu content
  , forceMount ::
      Opt Boolean -- ^ Whether to force mount the menu content in the DOM even when it is not open
  , className :: Opt String -- ^ The CSS class name of the menu content
  , style :: Opt CSS -- ^ The CSS style of the menu content
  }

-- | The foreign component for the DropdownMenuContent
foreign import contentImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuContent component
content :: forall p. Coerce p DropdownMenuContentProps => p -> Array JSX -> JSX
content props kids = React.element contentImpl
  $ (coerce props :: DropdownMenuContentProps) # RB.build
      (
        --      RB.modify (Proxy ∷ _ "onEscapeKeyDown") (pseudoMap mkEffectFn1)
        --          <<< RB.modify (Proxy ∷ _ "onPointerDownOutside") (pseudoMap mkEffectFn1)
        --          <<< RB.modify (Proxy ∷ _ "onFocusOutside") (pseudoMap mkEffectFn1)
        --          <<< RB.modify (Proxy ∷ _ "onInteractOutside") (pseudoMap mkEffectFn1)
        --          <<<
        RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuItem component props
type DropdownMenuItemProps =
  { disabled :: Opt Boolean -- ^ Whether the menu item is disabled or not
  , onSelect ::
      Opt EventHandler -- ^ A callback function that is called when the menu item is selected by a pointer or keyboard event
  , className :: Opt String -- ^ The CSS class name of the menu item
  , style :: Opt CSS -- ^ The CSS style of the menu item
  , asChild :: Opt Boolean
  }

-- | The foreign component for the DropdownMenuItem
foreign import itemImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuItem component
item :: forall p kids. Coerce p DropdownMenuItemProps => IsJSX kids => p -> kids -> JSX
item props kids = React.element itemImpl
  $ (coerce props :: DropdownMenuItemProps) # RB.build
--      ( RB.modify (Proxy :: _ "onSelect") (pseudoMap mkEffectFn1) <<<
          (RB.insert (Proxy :: _ "children") kids)
--      )

-- | The type of the DropdownMenuItemIndicator component props
type DropdownMenuItemIndicatorProps =
  { className :: Opt String -- ^ The CSS class name of the menu item indicator
  , style :: Opt CSS -- ^ The CSS style of the menu item indicator
  }

-- | The foreign component for the DropdownMenuItemIndicator
foreign import itemIndicatorImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuItemIndicator component
itemIndicator ::
  forall p kids.
  Coerce p DropdownMenuItemIndicatorProps =>
  IsJSX kids =>
  p ->
  kids ->
  JSX
itemIndicator props kids = React.element itemIndicatorImpl
  $ (coerce props :: DropdownMenuItemIndicatorProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuTrigger component props
type DropdownMenuTriggerProps =
  { className :: Opt String -- ^ The CSS class name of the menu trigger
  , style :: Opt CSS -- ^ The CSS style of the menu trigger
  , asChild ::
      Opt Boolean -- ^ Whether to render the menu trigger as a child of the menu content
  }

-- | The foreign component for the DropdownMenuTrigger
foreign import triggerImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuTrigger component
trigger ::
  forall p kids. Coerce p DropdownMenuTriggerProps => IsJSX kids => p -> kids -> JSX
trigger props kids = React.element triggerImpl
  $ (coerce props :: DropdownMenuTriggerProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuGroup component props
type DropdownMenuGroupProps = {}

-- | The foreign component for the DropdownMenuGroup
foreign import groupImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuGroup component
group :: forall p. Coerce p DropdownMenuGroupProps => p -> Array JSX -> JSX
group props kids = React.element groupImpl
  $ (coerce props :: DropdownMenuGroupProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuLabel component props
type DropdownMenuLabelProps =
  { className :: Opt String -- ^ The CSS class name of the menu label
  , style :: Opt CSS -- ^ The CSS style of the menu label
  }

-- | The foreign component for the DropdownMenuLabel
foreign import labelImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuLabel component
label :: forall p kids. Coerce p DropdownMenuLabelProps => IsJSX kids => p -> kids -> JSX
label props kids = React.element labelImpl
  $ (coerce props :: DropdownMenuLabelProps) # RB.build
      ( RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuCheckboxItem component props
type DropdownMenuCheckboxItemProps =
  { checked :: Opt Boolean -- ^ Whether the menu checkbox item is checked or not
  , onCheckedChange ::
      Opt (Boolean -> Effect Unit) -- ^ A callback function that is called when the menu checkbox item checked state changes
  , className :: Opt String -- ^ The CSS class name of the menu checkbox item
  , style :: Opt CSS -- ^ The CSS style of the menu checkbox item
  }

-- | The foreign component for the DropdownMenuCheckboxItem
foreign import checkboxItemImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuCheckboxItem component
checkboxItem :: forall p. Coerce p DropdownMenuCheckboxItemProps => p -> Array JSX -> JSX
checkboxItem props kids = React.element checkboxItemImpl
  $ (coerce props :: DropdownMenuCheckboxItemProps) # RB.build
      ( RB.modify (Proxy :: _ "onCheckedChange") (pseudoMap mkEffectFn1)
          <<< RB.insert (Proxy :: _ "children") kids
      )

-- | The type of the DropdownMenuRadioGroup component props
type DropdownMenuRadioGroupProps =
  { value ::
      Opt String -- ^ The value of the selected menu radio item in the group
  , onValueChange ::
      Opt (String -> Effect Unit) -- ^ A callback function that is called when the value of the selected menu radio item in the group changes
  }

-- | The foreign component for the DropdownMenuRadioGroup
foreign import radioGroupImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuRadioGroup component
radioGroup :: forall p. Coerce p DropdownMenuRadioGroupProps => p -> Array JSX -> JSX
radioGroup props' kids = do
  let props = coerce props' :: DropdownMenuRadioGroupProps
  React.element radioGroupImpl
    $ props # unsafeUnion
        { onValueChange: pseudoMap mkEffectFn1 props.onValueChange
        , children: kids
        }

-- | The type of the DropdownMenuRadioItem component props
type DropdownMenuRadioItemProps =
  { value :: String -- ^ The value of the menu radio item
  , className :: Opt String -- ^ The CSS class name of the menu radio item
  , style :: Opt CSS -- ^ The CSS style of the menu radio item
  }

-- | The foreign component for the DropdownMenuRadioItem
foreign import radioItemImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuRadioItem component
radioItem :: forall p. Coerce p DropdownMenuRadioItemProps => p -> Array JSX -> JSX
radioItem props kids = React.element radioItemImpl
  $ (coerce props :: DropdownMenuRadioItemProps) #
      unsafeSet "children" kids

-- | The type of the DropdownMenuSeparator component props
type DropdownMenuSeparatorProps =
  { className :: Opt String -- ^ The CSS class name of the menu separator
  , style :: Opt CSS -- ^ The CSS style of the menu separator
  }

-- | The foreign component for the DropdownMenuSeparator
foreign import separatorImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuSeparator component
separator :: forall p. Coerce p DropdownMenuSeparatorProps => p -> JSX
separator props = React.element separatorImpl
  $ (coerce props :: DropdownMenuSeparatorProps)

-- | The type of the DropdownMenuArrow component props
type DropdownMenuArrowProps =
  { className :: Opt String -- ^ The CSS class name of the menu arrow
  , style :: Opt CSS -- ^ The CSS style of the menu arrow
  , asChild :: Opt Boolean -- ^ Whether to render the menu arrow as a child of the menu content
  }

-- | The foreign component for the DropdownMenuArrow
foreign import arrowImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuArrow component
arrow ∷ ∀ p kids. IsJSX kids => Coerce p DropdownMenuArrowProps ⇒ p → kids -> JSX
arrow props kids = React.element arrowImpl
  $ (coerce props ∷ DropdownMenuArrowProps)# RB.build
      ( RB.insert (Proxy :: Proxy "children") kids)

-- | The type of the DropdownMenuSub component props
type DropdownMenuSubProps =
  { className :: Opt String }

-- | The foreign component for the DropdownMenuSub
foreign import subImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuSub component
sub :: forall p. Coerce p DropdownMenuSubProps => p -> Array JSX -> JSX
sub props kids = React.element subImpl
  $ (coerce props :: DropdownMenuSubProps) #
      unsafeSet "children" kids

-- | The type of the DropdownMenuSubTrigger component props
type DropdownMenuSubTriggerProps =
  { className :: Opt String -- ^ The CSS class name of the menu sub trigger
  , style :: Opt CSS -- ^ The CSS style of the menu sub trigger
  }

-- | The foreign component for the DropdownMenuSubTrigger
foreign import subTriggerImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuSubTrigger component
subTrigger ::
  forall p kids. Coerce p DropdownMenuSubTriggerProps => IsJSX kids => p -> kids -> JSX
subTrigger props kids = React.element subTriggerImpl
  $ (coerce props :: DropdownMenuSubTriggerProps) #
      unsafeSet "children" kids

-- | The type of the DropdownMenuSubContent component props
type DropdownMenuSubContentProps =
  { side ::
      Opt String -- ^ The preferred side of the menu sub content relative to the trigger
  , sideOffset ::
      Opt Number -- ^ The offset in pixels from the trigger to the menu sub content on the side axis
  , align ::
      Opt String -- ^ The preferred alignment of the menu sub content relative to the trigger on the side axis
  , alignOffset ::
      Opt Number -- ^ The offset in pixels from the trigger to the menu sub content on the align axis
  , className :: Opt String -- ^ The CSS class name of the menu sub content
  , style :: Opt CSS -- ^ The CSS style of the menu sub content
  }

-- | The foreign component for the DropdownMenuSubContent
foreign import subContentImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuSubContent component
subContent ::
  forall p kids. Coerce p DropdownMenuSubContentProps => IsJSX kids => p -> kids -> JSX
subContent props children = React.element subContentImpl
  $ (coerce props :: DropdownMenuSubContentProps) #
      unsafeUnion { children }

-- | The type of the DropdownMenuPortal component props
type DropdownMenuPortalProps =
  {
  }

-- | The foreign component for the DropdownMenuPortal
foreign import portalImpl :: forall a. ReactComponent { | a }

-- | A PureScript wrapper for the DropdownMenuPortal component
portal ::
  forall p kids. Coerce p DropdownMenuPortalProps => IsJSX kids => p -> kids -> JSX
portal props kids = React.element portalImpl
  $ (coerce props :: DropdownMenuPortalProps) #
      unsafeSet "children" kids