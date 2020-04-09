module Messages exposing (Msg(..))

import Browser
import Url

type Msg
    = DeviceResized Int Int
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url