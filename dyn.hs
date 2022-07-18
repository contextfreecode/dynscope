{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE RankNTypes #-}

import Data.List (intercalate)
import Text.Printf (printf)

data Env = Env {mode :: String}

reallyPerform :: (Show item, ?env :: Env) => [item] -> IO Int
reallyPerform task = do
  putStrLn $ printf "%s: %s" ?env.mode (show task)
  return $ length task

perform :: (Show item, ?env :: Env) => [item] -> IO Int
perform = reallyPerform

withMode :: (?env :: Env) => String -> ((?env :: Env) => result) -> result
withMode mode action =
  let ?env = ?env {mode} in action

main :: IO ()
main = do
  let ?env = Env {mode = "safe"}
  results <-
    map show
      <$> sequence
        [ perform "something",
          withMode "faster" perform "reliable",
          perform ["again"]
        ]
  putStrLn $ intercalate " " results

-- https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/implicit_parameters.html#extension-ImplicitParams
-- https://idris2.readthedocs.io/en/latest/tutorial/typesfuns.html#implicit-arguments
