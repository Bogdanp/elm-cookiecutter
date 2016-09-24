module Util exposing ((=>), thread)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


thread : (msg -> msg') -> ( m, Cmd msg ) -> ( m, Cmd msg' )
thread f ( model, cmd ) =
    ( model, Cmd.map f cmd )
