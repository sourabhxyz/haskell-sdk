module Main (main) where

import qualified Data.Text           as T
import           Maestro.Client.V0
import           Maestro.Run.Datum
import           Maestro.Run.Epochs
import           Maestro.Run.General
import           Maestro.Run.Pools
import           Maestro.Run.Scripts
import           Maestro.Run.Tx
import           System.Environment  (getEnv)


main :: IO ()

main = do
    apiKey <- maestroKey
    env <- mkMaestroEnv (T.pack apiKey) Preprod V0
    runPoolsAPI env
    runTxApi env
    runEpochsAPI env
    runDatumAPI env
    runScriptsAPI env
    runGeneralAPI env

    where
      maestroKey = getEnv  "MAESTRO_API_KEY"
