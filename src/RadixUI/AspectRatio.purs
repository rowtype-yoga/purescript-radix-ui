module RadixUI.AspectRatio where

import Prelude
import React.Basic (JSX, ReactComponent)
import Beta.DOM (class IsJSX)
import Beta.DOM.Internal (unsafeWithChildren)
import Data.Undefined.NoProblem (Opt)
import Record.Builder (build) as RB
import React.Basic (element) as React
import Data.Undefined.NoProblem.Closed (class Coerce, coerce)

foreign import rootImpl :: forall a. ReactComponent a

type AspectRatioProps =
  { asChild :: Opt Boolean
  , ratio :: Opt Number

  }
root ∷
  ∀ p kids. Coerce p AspectRatioProps ⇒ IsJSX kids ⇒ p → kids → JSX
root props kids = React.element rootImpl $
  (coerce props ∷ AspectRatioProps) # unsafeWithChildren kids
