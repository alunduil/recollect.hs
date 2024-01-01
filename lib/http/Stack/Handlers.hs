module Stack.Handlers (stack) where

import Data.ByteString.Lazy (ByteString)
import InMemory (InMemory)
import Servant (Handler, NoContent, Server, (:<|>) ((:<|>)))
import Stack.Api (StackApi)

stack :: ServerT StackApi (InMemory (Stack ByteString) ByteString)
stack = pop :<|> peek :<|> push

pop :: Handler ByteString
pop = undefined

peek :: Handler ByteString
peek = undefined

push :: ByteString -> Handler NoContent
push = undefined
