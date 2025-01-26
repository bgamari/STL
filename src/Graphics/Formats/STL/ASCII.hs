module Graphics.Formats.STL.ASCII
    ( -- * Parsing ASCII STL files
      parser
    , parse
      -- * Producing ASCII STL files
    , toSTL
    ) where

import Graphics.Formats.STL.Printer
import Graphics.Formats.STL.Parser
import Graphics.Formats.STL.Types

import Data.Text (Text)
import Data.Attoparsec.Text (parseOnly, Parser)

import qualified Data.ByteString.Lazy as BSL
import qualified Data.ByteString.Builder as BSB

toSTL :: STL -> BSL.ByteString
toSTL = BSB.toLazyByteString . textSTL


parser :: Parser STL
parser = stlParser

parse :: Text -> Either String STL
parse = parseOnly parser

