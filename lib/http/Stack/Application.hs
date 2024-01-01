module Stack.Application (application, run) where

import qualified Network.Wai.Handler.Warp as Warp (run)
import Servant (Application, Proxy (Proxy), serve)
import Stack.Api (StackApi)
import Stack.Handlers (stack)

run :: IO ()
run = Warp.run 8080 application

application :: Application
application = serve stackApi stack

stackApi :: Proxy StackApi
stackApi = Proxy
