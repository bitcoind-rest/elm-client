{-
   Bitcoind
   The REST API can be enabled with the `-rest` option. The interface runs on the same port as the JSON-RPC interface, by default port `8332` for **mainnet**, port `18332` for **testnet**, and port `18443` for **regtest**.

   OpenAPI spec version: 0.16
   Contact: johan@lepetitbloc.net

   NOTE: This file is auto generated by the swagger code generator program.
   https://github.com/swagger-api/swagger-codegen.git
   Do not edit this file manually.
-}


module Data.BIP exposing (BIP, bIPDecoder, bIPEncoder)

import Data.BIPReject exposing (BIPReject, bIPRejectDecoder, bIPRejectEncoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (decode, optional, required)
import Json.Encode as Encode
import Maybe exposing (map, withDefault)




type alias BIP =
    { id : Maybe String
    , version : Maybe Int
    , reject : Maybe BIPReject
    }


bIPDecoder : Decoder BIP
bIPDecoder =
    decode BIP
        |> optional "id" (Decode.nullable Decode.string) Nothing
        |> optional "version" (Decode.nullable Decode.int) Nothing
        |> optional "reject" (Decode.nullable bIPRejectDecoder) Nothing



bIPEncoder : BIP -> Encode.Value
bIPEncoder model =
    Encode.object
        [ ( "id", withDefault Encode.null (map Encode.string model.id) )
        , ( "version", withDefault Encode.null (map Encode.int model.version) )
        , ( "reject", withDefault Encode.null (map bIPRejectEncoder model.reject) )
        ]


