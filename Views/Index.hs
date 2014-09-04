{-# LANGUAGE OverloadedStrings #-}

module Views.Index where

import           Text.Blaze.Html5
import qualified Text.Blaze.Html5.Attributes   as A
import           Text.Blaze.Html.Renderer.Text


render = do
  html $ do
    body $ do
      h1 "My todo list"
      ul $ do
        li "make a haskell"
        li "learn website"
