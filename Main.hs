{-# LANGUAGE OverloadedStrings #-}
import           Web.Scotty
import qualified Data.Text                     as T
import           Data.Monoid                   (mconcat)
import           Network.HTTP.Types
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A 
import           Text.Blaze.Html.Renderer.Text

import qualified Views.Index

blaze = html . renderHtml

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

  -- 302 redirect
  get "/redirect-custom" $ do
    status status302
    setHeader "Location" "https://github.com"

  get "/json" $ do
    json ("{hi: 'there'}" :: String)
  
  -- Agent
  get "/agent" $ do
    agent <- header "User-Agent"
    text $ case agent of 
        Just a -> a
        Nothing -> "No agent"


  --Fancy
  get "/fancy" $ do
    html . renderHtml $ do
      H.h1 "Fancy!"

  -- Super View Fancy
  get "/view" $ do
    blaze Views.Index.render

  notFound $ do
    text "404: Page not Found. Sorry :<" 
