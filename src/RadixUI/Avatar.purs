module RadixUI.Avatar where

import Prelude
import React.Basic (JSX, ReactComponent)
import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import React.Basic (element) as React
import Data.Time.Duration (Milliseconds)
import Effect (Effect)
import Beta.DOM.Internal (CSS)
import Beta.DOM (class IsJSX)
import Effect.Uncurried (mkEffectFn1)
import Partial.Unsafe (unsafeCrashWith)
import Beta.DOM (unsafeWithChildren)
import Beta.DOM.Internal (class IsJSX)

foreign import rootImpl :: forall r. ReactComponent { | r }
foreign import imageImpl :: forall r. ReactComponent { | r }
foreign import fallbackImpl :: forall r. ReactComponent { | r }

type RootProps =
  { asChild :: Opt Boolean
  , className :: Opt String
  , style :: Opt CSS
  }

root :: forall p kids. Coerce p RootProps => IsJSX kids => p -> kids -> JSX
root props kids = React.element rootImpl
  $ (coerce props :: RootProps) # unsafeWithChildren kids

data ImageLoadingStatus =
  ImageLoadingStatusIdle |
  ImageLoadingStatusLoading |
  ImageLoadingStatusLoaded |
  ImageLoadingStatusError

toImageLoadingStatus :: String -> ImageLoadingStatus
toImageLoadingStatus = case _ of
  "idle" -> ImageLoadingStatusIdle
  "loading" -> ImageLoadingStatusLoading
  "loaded" -> ImageLoadingStatusLoaded
  "error" -> ImageLoadingStatusError
  other -> unsafeCrashWith $ "Invalid value " <> other <> " for ImageLoadingStatus"

type ImageProps =
  { asChild :: Opt Boolean
  , className :: Opt String
  , src :: Opt String
  , alt :: Opt String
  , style :: Opt CSS
  , onLoadingStatusChange :: Opt (ImageLoadingStatus -> Effect Unit)
  }

image :: forall p kids. Coerce p ImageProps => IsJSX kids => p -> kids -> JSX
image props' kids = do
  let props = coerce props' :: ImageProps
  React.element imageImpl $ props
    { onLoadingStatusChange = pseudoMap (mkEffectFn1 <<< (toImageLoadingStatus >>> _)) props.onLoadingStatusChange }
    # unsafeWithChildren kids


type FallbackProps =
  { asChild :: Opt Boolean
  , delayMs :: Opt Milliseconds
  , className :: Opt String
  , style :: Opt CSS
  }

fallback :: forall p kids. Coerce p FallbackProps => IsJSX kids => p -> kids -> JSX
fallback props kids = React.element fallbackImpl
  $ (coerce props :: FallbackProps) # unsafeWithChildren kids


