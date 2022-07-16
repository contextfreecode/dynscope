{-# LANGUAGE ImplicitParams #-}

import Text.Printf (printf)

reallyPerform :: String -> IO ()
reallyPerform task = putStrLn $ printf "%s: %s" "mode" task

perform :: String -> IO ()
perform = reallyPerform

main :: IO ()
main = do
    perform "something"
    perform "reliable"
    perform "again"
