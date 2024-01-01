module Stack.Application (application, run) where

import qualified Network.Wai.Handler.Warp as Warp (run)
import Servant (Application, Server, hoistServer, serve)
import Stack.Api (StackApi, stackApi)
import Stack.Handlers (stack)
import Stack.Types (stackMToHandler)

run :: IO ()
-- TODO Configuration Via Flags
run = Warp.run 8080 application

application :: Application
application = serve stackApi server

server :: Server StackApi
server = hoistServer stackApi stackMToHandler stack
