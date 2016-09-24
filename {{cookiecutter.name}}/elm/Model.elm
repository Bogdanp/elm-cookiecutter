module Model exposing (Flags, Msg(..), Model)

import Pages.Dashboard as Dashboard
import Routes exposing (Sitemap)
import Time exposing (Time)


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
