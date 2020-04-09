module Update exposing (update)

import Model exposing (Model)
import Messages exposing (Msg(..))
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DeviceResized w h ->
            ( { model | x = w, y = h }
            , Cmd.none )
        
        LinkClicked _ -> ( model, Cmd.none )
        
        UrlChanged _ -> ( model, Cmd.none )