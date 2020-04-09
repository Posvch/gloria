module View exposing (view)

import Browser

import Element exposing (..)
import Element.Font as Font
import Element.Border as Border
import Element.Background as Background
import Element.Input as Input 
import Element.Events as Events
import Messages exposing (Msg(..))
import Model exposing (Model)

view : Model -> Browser.Document Msg
view model =
    { title = "Title"
    , body =
        [ layout
            [ behindContent <| el
                [ width fill
                , height fill
                , Background.color ( rgb 0.94 0.94 0.95 )
                ] none
            ]
            <| column [ width fill, height fill ]
                [ navbar
                , lead ( model.y - 307 )
                , footer
                ]
        ]
    }

navbar : Element msg
navbar =
    row [ centerX, width <| maximum 1200 fill, paddingXY 36 36 ]
        [ column
            [ width fill
            , height fill
            , Font.family [Font.typeface "Gilroy" ] ]
            [ el
                [ centerX
                , centerY
                , padding 12
                , Font.size 72
                , Font.light
                , Font.letterSpacing 18 ]
                <| text "GLORIA"
            , el
                [ Border.width 1
                , centerX
                , centerY
                , Font.size 18 ]
                <| el [ paddingXY 8 5 ] <| text "Юридическая компания"
            , row
                [ centerX
                , centerY
                , paddingXY 0 18
                , width <| maximum 640 fill
                , spaceEvenly
                ]
                <| List.map
                    navLink
                    ["Главная", "О нас", "Услуги", "Контакты"]
            ]
        , image [ paddingXY 36 0 ] { src="/static/img/gera_140.webp", description="logo" }
        ]

navLink : String -> Element msg
navLink labelText =
    link []
        { url = "#"
        , label = el [ moveDown 7, Font.size 18, Font.family [ Font.typeface "Garamond" ], Font.letterSpacing 1 ]
            <| text labelText
        }

footer : Element msg
footer = el [ width fill, alignBottom, Background.color ( rgb 0 0 0 ) ]
    <| wrappedRow
        [ centerX
        , width <| maximum 1200 fill
        , padding 36
        , spacingXY 36 18
        , Font.size 18
        , Font.color ( rgb 1 1 1 )
        , Font.size 18, Font.family [ Font.typeface "Garamond" ]
        , Font.letterSpacing 1
        ]
        [ wrappedRow [ centerY, width fill, spacingXY 36 18 ]
            [ paragraph [  ] [ text "GLORIA ", text "ЮРИДИЧЕСКИЕ КОНСУЛЬТАЦИИ В ТЮМЕНИ" ]
            , paragraph [  ] [ text "Адрес: г. Тюмень, ул. Монтажников 61, офис 28" ]
            ]
        , wrappedRow [ centerY, width fill, spacingXY 36 18 ]
            [ paragraph [  ] [ text "Email: something@mail.mail" ]
            , wrappedRow [  ] [ text "Номер телефона:", text "8-800-555-35-35" ]
            , paragraph [ ] [ text "Социальные сети: vk" ]
            ]
        ]

lead : Int -> Element Msg
lead h =
    column
        [ centerX
        , width <| maximum 1200 fill
        ]
        [ row
            [ width fill
            , height shrink
            , Background.color (rgb 0.95 0.95 1 )
            ]
            [ el
                [ Background.color ( rgb 0.9 0.9 0.9 )
                , Background.image "/static/img/stock.jpg"
                , height fill
                , width <| fillPortion 2
                , padding 36 ] none
            , column
                [ height fill
                , centerX
                , width <| maximum 700 <| fillPortion 3
                , paddingXY 36 18
                , spacing 18
                , Font.size 18
                , Font.size 18, Font.family [ Font.typeface "Garamond" ]
                ]
                [ paragraph
                    [ Font.size 36
                    , Font.letterSpacing 1
                    , Font.semiBold
                    , Font.family [ Font.typeface "Gilroy" ]
                    ]
                    [ text "ЮРИДИЧЕСКИЕ КОНСУЛЬТАЦИИ В ТЮМЕНИ"
                    ]
                , paragraph []
                    [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." ]
                , column [ padding 18, spacing 18 ]
                    [ paragraph [] [ text "- Lorem ipsum dolor sit amet" ]
                    , paragraph [] [ text "- Lorem ipsum dolor sit" ]
                    , paragraph [] [ text "- Lorem ipsum dolor sit amet" ]
                    ]
                , el [alignRight] roundButton
                ]
            ]
        , row
            [ width fill
            , height ( px 100 )
            , Background.color (rgb 1 1 1 )
            ]
            []
        ]


roundButton : Element Msg
roundButton = Input.button
    [ paddingXY 36 18
    , Background.color ( rgb 0.85 0.85 0.9 )
    , Border.width 1
    , mouseOver
        [moveUp 1
        , Background.color ( rgb 1 1 1 )
        , Border.shadow
            { offset = ( 1, 3 )
            , size = 3
            , blur = 6
            , color = rgba 0 0 0 0.4
            }
        ]
    ]
    { onPress = Nothing
    , label = el
        [ Font.light
        , Font.family [ Font.typeface "Gilroy" ]
        , Font.letterSpacing 1
        ]
        <| text "Кнопка⟶" -- ❯
    }