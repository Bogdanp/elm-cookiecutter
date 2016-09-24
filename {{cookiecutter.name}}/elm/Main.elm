module Main exposing (main)

import Model exposing (Flags)
import Navigation
import Routes exposing (parseLocation)
import Update exposing (init, update, updateRoute, subscriptions)
import View exposing (view)


main : Program Flags
main =
    Navigation.programWithFlags parseLocation
        { init = init
        , update = update
        , urlUpdate = updateRoute
        , subscriptions = subscriptions
        , view = view
        }
