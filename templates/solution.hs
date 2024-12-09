import System.Environment(getArgs)

main :: IO ()
main = do
  input <- readInput
  printSolution 1 $ solution1 input
  printSolution 2 $ solution2 input

part1 :: IO ()
part1 = do
  input <- readInput
  printSolution 1 $ solution1 input

part2 :: IO ()
part2 = do
  input <- readInput
  printSolution 2 $ solution2 input

-------------------------------------------------------------------------

readInput :: IO [String]
readInput = do
  args <- getArgs
  let filename = "./" ++ head args ++ ".txt"
  fileContent <- readFile filename
  return (lines fileContent)

printSolution :: Integer -> String -> IO ()
printSolution number value = do
  putStrLn "====================="
  putStrLn $ "Solution" ++ show number ++ ": " ++ value
  putStrLn "====================="

-------------------------------------------------------------------------

solution1 :: [String] -> String
solution1 _ = "..."

solution2 :: [String] -> String
solution2 _ = "..."

-------------------------------------------------------------------------
