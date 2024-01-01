{-# LANGUAGE ExplicitNamespaces #-}

module Stack.Handlers (stack) where

import Data.ByteString.Lazy (ByteString)
import Servant (ServerT, (:<|>) ((:<|>)))
import Stack.Api (StackApi)
import Stack.Types (StackM, peek, pop, push)

stack :: ServerT StackApi (StackM ByteString)
stack = pop :<|> peek :<|> push
