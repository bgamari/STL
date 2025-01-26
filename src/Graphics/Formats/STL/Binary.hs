module Graphics.Formats.STL.Binary
    ( -- * Parsing binary STL files
      parser
    , parse
      -- * Producing binary STL files
    , toSTL
    ) where

import Data.Binary
import Data.Binary.Get
import Data.Binary.Put
import qualified Data.ByteString as BS
import Data.ByteString.Lazy (ByteString)

import Graphics.Formats.STL.Types

parser :: Get STL
parser = get

parse :: ByteString -> Either String STL
parse bs =
    case decodeOrFail bs of
      Left (_, _, err) -> Left err
      Right (_, _, stl) -> Right stl


toSTL :: STL -> ByteString
toSTL = encode
