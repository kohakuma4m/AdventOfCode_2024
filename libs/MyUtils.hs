module MyUtils where

import System.Environment(getArgs,getProgName)

readInput :: IO [String]
readInput = do
  args <- getArgs
  programName <- getProgName
  let folderName = if programName == "<interactive>" then "./" else "./" ++ programName ++ "/"
  let filename = folderName ++ head args ++ ".txt"
  fileContent <- readFile filename
  return (lines fileContent)

printSolution :: Integer -> String -> IO ()
printSolution number value = do
  putStrLn "====================="
  putStrLn $ "Solution" ++ show number ++ ": " ++ value
  putStrLn "====================="
