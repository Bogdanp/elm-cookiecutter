module View exposing (view)

import Html as H exposing (Html)
import Html.App as App
import Model exposing (Msg(..), Model)
import Pages.Dashboard as Dashboard
import Routes exposing (Sitemap(..))


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
