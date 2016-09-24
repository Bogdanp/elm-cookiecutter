module Routes
    exposing
        ( Sitemap(..)
        , parseLocation
        , navigateTo
        , toString
        )

import Navigation exposing (Location, Parser)
import Route exposing (..)


type Sitemap
    = DashboardR
    | NotFoundR


dashboardR : Route Sitemap
dashboardR =
    DashboardR := static ""


sitemap : Router Sitemap
sitemap =
    router [ dashboardR ]


match : Location -> Sitemap
match =
    .pathname >> Route.match sitemap >> Maybe.withDefault NotFoundR


toString : Sitemap -> String
toString route =
    case route of
        DashboardR ->
            reverse dashboardR []

        NotFoundR ->
            Debug.crash "Routes.toString: cannot route to NotFoundR"


parseLocation : Parser Sitemap
parseLocation =
    Navigation.makeParser match


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
