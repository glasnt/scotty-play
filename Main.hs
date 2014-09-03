{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import qualified Data.Text as T
import Data.Monoid (mconcat)

main = scotty 3000 $ do

  -- Home
  get "/" $ do
    text "Hello World!"
  
  -- Endpoint
  get "/hi" $ do
    text "hi!"

  -- Endpoint with named param
  get "/beam/:word" $ do
    beam <- param "word"
    html $ mconcat ["Scotty, beam ", beam, " up!"]

  -- Mandatory query string param
  get "/holodeck" $ do
    program <- param "program"
    text $ mconcat ["Computer: Start holodeck program ", program ]
    -- Todo how to have optional parameters?

  notFound $ do
    text "404: Page not Found. Sorry :<" 
