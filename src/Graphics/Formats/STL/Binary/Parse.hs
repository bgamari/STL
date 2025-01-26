module Graphics.Formats.STL.Binary.Parse
    ( parser
    , parse
    ) where

import Data.Binary

import Graphics.Formats.STL.Types

parser :: Get STL
parser = get

parse :: ByteString -> Either String STL
parse bs =
    case runGetOrFail parser bs of
      Left (_, _, err) -> Left err
      Right (_, _, stl) -> Right stl

