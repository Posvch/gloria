module Model exposing (Model)

import Url
import Browser.Navigation as Nav

type alias Model =
    { x : Int
    , y : Int
    , url : Url.Url
    , key : Nav.Key
    }