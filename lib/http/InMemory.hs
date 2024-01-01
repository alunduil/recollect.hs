module InMemory (InMemory, runInMemory) where

import Control.Monad.Except (ExceptT)
import Control.Monad.Identity (Identity)
import Control.Monad.State (StateT, runStateT)

type InMemory s e = StateT s (ExceptT e Identity)

runInMemory :: InMemory s e a -> s -> Either e a
runInMemory inMemory s = Right . fst <$> runStateT inMemory s
