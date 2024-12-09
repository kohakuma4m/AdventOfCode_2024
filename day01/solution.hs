import System.Environment(getArgs)
import Data.List (sort)
import Distribution.PackageDescription (license')

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
solution1 input =
  let (ls, rs) = parseInput input                   -- Parsing input into left and right lists
      (ls', rs') = (sort ls, sort rs)               -- Sorting left/right lists
      pairs = zip ls' rs'                           -- Pairing elements
  in show $ sum $ map distance pairs                -- Adding all pairs' distances
  where distance (a, b) = abs (a - b)

solution2 :: [String] -> String
solution2 input =
  let (ls, rs) = parseInput input                   -- Parsing input into left and right lists
  in show $ sum $ map (similarityScore rs) ls       -- Adding all left list elements' similarity score
  where similarityScore xs x = x * length (filter (== x) xs)

-------------------------------------------------------------------------

parseInput :: [String] -> ([Int], [Int])
parseInput = foldr parseLine ([], [])
  where parseLine currentLine (ls, rs) =
          let lineWords = words currentLine
              leftNumber = read (head lineWords) :: Int
              rightNumber = read (last lineWords) :: Int
          in (ls ++ [leftNumber], rs ++ [rightNumber])
