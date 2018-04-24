{-
   Bitcoind
   The REST API can be enabled with the `-rest` option. The interface runs on the same port as the JSON-RPC interface, by default port `8332` for **mainnet**, port `18332` for **testnet**, and port `18443` for **regtest**.

   OpenAPI spec version: 0.16
   Contact: johan@lepetitbloc.net

   NOTE: This file is auto generated by the swagger code generator program.
   https://github.com/swagger-api/swagger-codegen.git
   Do not edit this file manually.
-}


module Request.MemoryPool exposing (restGetutxos, restHeaders, restMempoolContents, restMempoolInfo)

import Data.InlineResponse200 exposing (InlineResponse200, inlineResponse200Decoder)
import Data.InlineResponseDefault exposing (InlineResponseDefault, inlineResponseDefaultDecoder)
import Data.String exposing (Decode.string, String)
import Data.MemoryPool exposing (MemoryPool, memoryPoolDecoder)
import Http
import Json.Decode as Decode


basePath : String
basePath =
    "http://localhost:3000/rest"


{-
   Only supports JSON as output format.
-}
restGetutxos : String -> String -> String -> Http.Request InlineResponse200
restGetutxos txHash txOutput format =
    { method = "GET"
    , url = basePath ++ "/getutxos/checkmempool/" ++ txHash ++ "-" ++ txOutput ++ "." ++ format
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson inlineResponse200Decoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   Only supports BIN and HEX as output format.
-}
restHeaders : Int -> String -> String -> Http.Request String
restHeaders headerCount blockHash format =
    { method = "GET"
    , url = basePath ++ "/headers/" ++ toString headerCount ++ "/" ++ blockHash ++ "." ++ format
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson Decode.string
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   Only supports JSON as output format.
-}
restMempoolContents : Http.Request InlineResponseDefault
restMempoolContents =
    { method = "GET"
    , url = basePath ++ "/mempool/contents.json"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson inlineResponseDefaultDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-
   Only supports JSON as output format.
-}
restMempoolInfo : Http.Request MemoryPool
restMempoolInfo =
    { method = "GET"
    , url = basePath ++ "/mempool/info.json"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson memoryPoolDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


