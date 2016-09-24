module Update exposing (init, update, updateRoute, subscriptions)

import Model exposing (Flags, Msg(..), Model)
import Pages.Dashboard as Dashboard
import Routes exposing (Sitemap(..))
import Time
import Util exposing (thread)


init : Flags -> Sitemap -> ( Model, Cmd Msg )
init { now } route =
    updateRoute route
        { now = now
        , route = route
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick now ->
            { model | now = now } ! []

        RouteTo route ->
            model ! [ Routes.navigateTo route ]

        ToDashboard msg ->
            Dashboard.update msg model
                |> thread ToDashboard


updateRoute : Sitemap -> Model -> ( Model, Cmd Msg )
updateRoute route m =
    let
        model =
            { m | route = route }
    in
        case route of
            DashboardR ->
                Dashboard.init model
                    |> thread ToDashboard

            NotFoundR ->
                model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Time.every Time.second Tick ]
