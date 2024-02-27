{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Stack.Api (StackApi, stackApi) where

import Data.ByteString.Lazy (ByteString)
import Servant
  ( Delete,
    Get,
    NoContent,
    OctetStream,
    Post,
    Proxy (Proxy),
    ReqBody,
    (:<|>),
    (:>),
  )

type StackApi =
  -- Pop
  Delete '[OctetStream] ByteString
    -- Peek
    :<|> Get '[OctetStream] ByteString
    -- Push
    -- TODO PostCreated or PostAccepted?
    :<|> ( ReqBody '[OctetStream] ByteString
             :> Post '[OctetStream] NoContent
         )

stackApi :: Proxy StackApi
stackApi = Proxy
