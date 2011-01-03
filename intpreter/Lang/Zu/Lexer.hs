-----------------------------------------------------------------------------
-- |
-- Module      :  Lang.Zu.Program
-- Copyright   :  (c) Mingli Yuan 2011
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  me@mingli-yuan.info
-- Stability   :  experimental
-- Portability :  portable
--
-----------------------------------------------------------------------------

module Lang.Zu.Lexer where

import Text.ParserCombinators.Parsec
import qualified Text.ParserCombinators.Parsec.Token as P
import Text.ParserCombinators.Parsec.Language( emptyDef, reservedNames, reservedOpNames )

lexer :: P.TokenParser ()
lexer = P.makeTokenParser
    (emptyDef {
                     commentStart :: String
                     commentEnd :: String
                     commentLine :: String
                     nestedComments :: Bool
                     identStart :: ParsecT s u m Char
                     identLetter :: ParsecT s u m Char
                     opStart :: ParsecT s u m Char
                     opLetter :: ParsecT s u m Char
                     reservedNames = ["native", "def", "return", "yield", "raise", "catch", "finally"],
                     reservedOpNames = [ ":",",","..",":=","<-",
                                         "+", "-", "*", "/", "^", "!", "&", "|",
                                         "->", "<->", '</>',
                                         "==", "=/=", ">", "<", ">=", "<=",
                                         "&&", "||",
                                         "-->", "<-->", '<-/->',
                                         "?"
                                       ]
                     caseSensitive :: Bool
                }
    )

whiteSpace = P.whiteSpace lexer
lexeme     = P.lexeme lexer
symbol     = P.symbol lexer
natural    = P.natural lexer
parens     = P.parens lexer
semi       = P.semi lexer
comma       = P.comma lexer
identifier = P.identifier lexer
stringLiteral = P.stringLiteral lexer
reserved   = P.reserved lexer
reservedOp = P.reservedOp lexer
