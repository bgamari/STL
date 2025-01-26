module Graphics.Formats.STL
    ( STL(..), Triangle(..), Vector
      -- * Parsing
    , parseSTL
    , parseASCII
    , parseBinary
      -- * Printing
    , toASCII
    , toBinary
    ) where

import qualified Data.ByteString.Lazy.Char8 as BSL
import qualified Data.Text.Encoding as TE

import Graphics.Formats.STL.Types
import qualified Graphics.Formats.STL.ASCII as ASCII
import qualified Graphics.Formats.STL.Binary as Binary

-- | Parse an STL file of either format.
parseSTL :: BSL.ByteString -> Either String STL
parseSTL bs
  | magic `BSL.isPrefixOf` bs = parseASCII bs
  | otherwise                 = parseBinary bs
  where
    magic = BSL.pack "solid "

parseBinary :: BSL.ByteString -> Either String STL
parseBinary = Binary.parse

parseASCII :: BSL.ByteString -> Either String STL
parseASCII = ASCII.parse . TE.decodeASCII . BSL.toStrict

toASCII :: STL -> BSL.ByteString
toASCII = ASCII.toSTL

toBinary :: STL -> BSL.ByteString
toBinary = Binary.toSTL
