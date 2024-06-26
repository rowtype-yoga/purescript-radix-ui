module RadixUI.Avatar where

import Prelude

import Beta.DOM (class IsJSX)
import Beta.DOM (unsafeWithChildren)
import Beta.DOM.Internal (CSS)
import Beta.DOM.Internal (class IsJSX)
import Data.Time.Duration (Milliseconds)
import Data.Undefined.NoProblem (Opt, pseudoMap)
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import Partial.Unsafe (unsafeCrashWith)
import React.Basic (JSX, ReactComponent)
import React.Basic (element) as React
import Unsafe.Coerce (unsafeCoerce)

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

image :: forall p. Coerce p ImageProps => p -> JSX
image props' = do
  let props = coerce props' :: ImageProps
  React.element imageImpl $ unsafeCoerce $ props
    { onLoadingStatusChange = pseudoMap (mkEffectFn1 <<< (toImageLoadingStatus >>> _)) props.onLoadingStatusChange :: Opt (EffectFn1 String Unit)
    }


type FallbackProps =
  { asChild :: Opt Boolean
  , delayMs :: Opt Milliseconds
  , className :: Opt String
  , style :: Opt CSS
  }

fallback :: forall p kids. Coerce p FallbackProps => IsJSX kids => p -> kids -> JSX
fallback props kids = React.element fallbackImpl
  $ (coerce props :: FallbackProps) # unsafeWithChildren kids


