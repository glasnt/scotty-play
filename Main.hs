{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import qualified Data.Text as T
import Data.Monoid (mconcat)

main = scotty 3000 $ do
  get "/" $ do
    text "Hello World!"
  
  get "/hi" $ do
    text "hi!"

  get "/beam/:word" $ do
    beam <- param "word"
    html $ mconcat ["Scotty, beam ", beam, " up!"]

  notFound $ do
    text "404: Page not Found. Sorry :<" 
