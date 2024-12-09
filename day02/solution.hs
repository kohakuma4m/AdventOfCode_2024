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
solution1 input =
  let reports = parseInput input                                -- Parsing input into reports containing levels
  in show $ length $ filter isSafeReport reports                -- Counting number of safe reports

solution2 :: [String] -> String
solution2 input =
  let reports = parseInput input                                -- Parsing input into reports containing levels
  in show $ length $ filter isSafeReportWithDampener reports    -- Counting number of safe reports with problem dampener module on
  where isSafeReportWithDampener levels = isSafeReport levels || any isSafeReport (generateAllSubListsWithOneRemovedElement levels)

-------------------------------------------------------------------------

parseInput :: [String] -> [[Int]]
parseInput = map parseLine
  where parseLine currentLine = map (read::String->Int) $ words currentLine

isSafeReport :: [Int] -> Bool
isSafeReport levels =
  let levelDifferences = zipWith (-) levels (tail levels)   -- Calculating level differences
  in (isSortedAsc levels || isSortedDesc levels)            -- All levels are increasing or decreasing
    && all (isValidDifference . abs) levelDifferences       -- All level differences are valid (using absolute value so it work for both orderings)
  where
    isSortedAsc (x:y:xs) = x <= y && isSortedAsc (y:xs)     -- List in ascending order ?
    isSortedAsc _ = True                                    -- (Empty list or list of only one element)
    isSortedDesc (x:y:xs) = y <= x && isSortedDesc (y:xs)   -- List in descending order ?
    isSortedDesc _ = True                                   -- (Empty list or list of only one element)
    isValidDifference x = x >= 1 && x <= 3                  -- Valid value ?

generateAllSubListsWithOneRemovedElement :: [Int] -> [[Int]]
generateAllSubListsWithOneRemovedElement xs =
  let xs' = zip xs [0..]                                    -- List with added indexes
  in foldl spliceListElement [] xs'                         -- Generating all possible list variations with only one element remove
  where
    spliceListElement ys (_, idx) =
      let (left, right) = splitAt idx xs
      in ys ++ [left ++ tail right]                         -- Removing element at given index position