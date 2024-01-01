{-# LANGUAGE OverloadedStrings #-}

module Stack.Types (StackM, runStackM, pop, peek, push, stackMToHandler) where

import Control.Concurrent.STM (atomically, modifyTVar, newTVarIO, readTVar, readTVarIO, writeTVar)
import Control.Concurrent.STM.TVar (TVar)
import Control.Exception (throw)
import Control.Monad.Reader (MonadIO (liftIO), MonadReader (ask), ReaderT (runReaderT))
import Data.Stack (Stack, stackNew, stackPeek, stackPop, stackPush)
import Servant (Handler, NoContent (NoContent), ServerError (errBody), err404)

type StackM a = ReaderT (TVar (Stack a)) Handler

runStackM :: Stack a -> StackM a b -> Handler b
runStackM i s = liftIO (newTVarIO i) >>= runReaderT s

stackMToHandler :: StackM a b -> Handler b
stackMToHandler = runStackM stackNew

pop :: StackM a a
pop = do
  t <- ask
  liftIO $ atomically $ do
    s <- readTVar t
    case stackPop s of
      (Just (s', result)) -> writeTVar t s' >> pure result
      Nothing -> throw $ err404 {errBody = "Stack is empty."}

peek :: StackM a a
peek = do
  t <- ask
  s <- liftIO $ readTVarIO t
  case stackPeek s of
    (Just result) -> pure result
    Nothing -> throw $ err404 {errBody = "Stack is empty."}

push :: a -> StackM a NoContent
push x = ask >>= liftIO . atomically . flip modifyTVar (`stackPush` x) >> pure NoContent
