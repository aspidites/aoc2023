{-# LANGUAGE DataKinds #-}
module Cli ( Config(..) ) where

import Options.Generic

data Config w = Config
  { day :: w ::: Maybe Int <?> "Which day to run solutions for"
  , input :: w ::: Maybe String <?> "Input file to run solution against"
  , json :: w ::: Bool <?> "Whether or not to show results as JSON"
  } deriving (Generic)

instance ParseRecord (Config Wrapped)
deriving instance Show (Config Unwrapped)
