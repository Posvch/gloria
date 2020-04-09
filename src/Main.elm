module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Browser.Events exposing (onResize)
import Url

import Model exposing (Model)
import Messages exposing (Msg(..))
import Update exposing (update)
import View exposing (view)



type alias Flags =
    { x : Int
    , y : Int
    , ua : String
    }

main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }

init : Flags -> Url.Url-> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { x = flags.x
      , y = flags.y
      , url = url
      , key = key  
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    onResize <|
        \width height ->
            DeviceResized width height
