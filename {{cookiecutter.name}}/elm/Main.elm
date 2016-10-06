module Main exposing (main)

import Html as H exposing (Html)
import Html.App as App
import Navigation
import Pages.Dashboard as Dashboard
import Routes exposing (Sitemap(..), parseLocation)
import Time exposing (Time)
import Util exposing (thread)


type alias Flags =
    { now : Time }


type Msg
    = Tick Time
    | RouteTo Sitemap
    | ToDashboard Dashboard.Msg


type alias Model =
    { now : Time
    , route : Sitemap
    }


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


view : Model -> Html Msg
view ({ route } as model) =
    case route of
        DashboardR ->
            Dashboard.view model
                |> App.map ToDashboard

        NotFoundR ->
            notFound


notFound : Html msg
notFound =
    H.h1 [] [ H.text "Not Found" ]


main : Program Flags
main =
    Navigation.programWithFlags parseLocation
        { init = init
        , update = update
        , urlUpdate = updateRoute
        , subscriptions = subscriptions
        , view = view
        }
