module Pages.Dashboard exposing (Msg, Model, init, update, view)

import Date
import Html as H exposing (Html)
import Html.Attributes as A
import Time exposing (Time)


type Msg
    = Ignore


type alias Model m =
    { m | now : Time }


init : Model m -> ( Model m, Cmd Msg )
init model =
    model ! []


update : Msg -> Model m -> ( Model m, Cmd Msg )
update msg model =
    case msg of
        Ignore ->
            model ! []


view : Model m -> Html Msg
view { now } =
    H.div
        [ A.class "dashboard" ]
        [ H.text <| time now
        ]


time : Time -> String
time t =
    let
        date =
            Date.fromTime t
    in
        toString (Date.hour date) ++ ":" ++ toString (Date.minute date) ++ ":" ++ toString (Date.second date)
