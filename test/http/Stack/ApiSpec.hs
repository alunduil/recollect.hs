module Stack.ApiSpec (spec) where

import Servant ((:<|>) ((:<|>)))
import Servant.Client (client)
import Stack.Api (stackApi)
import Test.Hspec (Spec, describe)

spec :: Spec
spec = describe "Api" $ do
  describe "properties" $ do
    it "(∀x)(pop (push x) == x)" pending
    it "peek empty => 404" pending
    it "(∀x)(peek (push x) == x)" pending
    it "peek == pop" pending
    it "pop empty => 404" pending
    it "(∀x)(pop (push x) == x)" pending

(pop :<|> peek :<|> push) = client stackApi
