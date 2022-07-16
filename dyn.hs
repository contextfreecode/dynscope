{-# LANGUAGE ImplicitParams #-}

import Text.Printf (printf)

reallyPerform :: Show a => [a] -> IO Int
reallyPerform task = do
    putStrLn $ printf "%s: %s" "mode" (show task)
    return $ length task

perform :: Show a => [a] -> IO Int
perform = reallyPerform

main :: IO ()
main = do
    a <- perform "something"
    b <- perform "reliable"
    c <- perform ["again"]
    putStrLn $ printf "result: %d" $ a + b + c
