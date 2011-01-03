-----------------------------------------------------------------------------
-- |
-- Module      :  Lang.Zu.AST
-- Copyright   :  {c} Mingli Yuan 2011
-- License     :  BSD-style {see the file LICENSE}
--
-- Maintainer  :  me@mingli-yuan.info
-- Stability   :  experimental
-- Portability :  portable
--
-----------------------------------------------------------------------------

module Lang.Zu.AST (
) where

---------------------------------------------
-- Structure part
---------------------------------------------

data Identifier = Id String
data Identifiers = Ids [Identifier]

data Value = IValue Integer | CValue Char | SValue String |
             PValue Pair | TValue Values | AValue Values |
             MValue [Pair] |
             BValue Block

data Pair = Pair Value Value
data Values = Values [Value]

data Block = Block Identifiers [Statement]

data Binding = Bnd Identifier Expression
data Environment = Local [Binding] | Chain [Environment]

data Iteration = Iteration Identifier Expression
data Enumeration = Enumeration [Iteration]

data Statement = Expr Expression |
                 Def Identifier Expression | Asgn Idetifiers Expressions |
                 Ret Expression

data Operator = Prefix String | Affix String |
                LBin Int String | MBin Int String | RBin Int String |
                Ter String String

data Expression = Val Value | Vals Values | Ref Identifier |
                  Unary Operator Expression |
                  Binary Operator Expression Expression |
                  Ternary Operator Expression Expression Expression |
                  Exprs Expressions |
                  PExpr EPair | TExpr ETuple | AExpr EArray | MExpr EMap |
                  Addr Expression Int |
                  Lookup Expression String |
                  Eval Block Environment | Expand Block Enumeration

data EPair = EPair Expression Expression
data Expressions = AllOf [Expression] |
                   Interval Expression Expression |
                   Infinit Expression
data ETuple = ET Expressions
data EArray = EA Expressions
data EMap  = EM [EPair]


