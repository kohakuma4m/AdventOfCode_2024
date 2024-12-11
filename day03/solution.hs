{-# OPTIONS_GHC -Wno-unused-top-binds #-}
import qualified MyUtils
import Text.Regex.Posix

main :: IO ()
main = do
  input <- MyUtils.readInput
  MyUtils.printSolution 1 $ solution1 input
  MyUtils.printSolution 2 $ solution2 input

part1 :: IO ()
part1 = do
  input <- MyUtils.readInput
  MyUtils.printSolution 1 $ solution1 input

part2 :: IO ()
part2 = do
  input <- MyUtils.readInput
  MyUtils.printSolution 2 $ solution2 input

-------------------------------------------------------------------------

solution1 :: [String] -> String
solution1 input =
  let mulValues = parseMulInstructions $ concat input           -- Parsing input for multiplication instruction pair of values
  in show $ foldr (\(x,y) acc -> acc + x * y) 0 mulValues       -- Adding product of all pair values

solution2 :: [String] -> String
solution2 input =
  let mulValues = parseDoMulInstructions $ concat input         -- Parsing input for multiplication instruction pair of values
  in show $ foldr (\(x,y) acc -> acc + x * y) 0 mulValues    -- Adding product of all pair values

-------------------------------------------------------------------------

parseMulInstructions :: String -> [(Int, Int)]
parseMulInstructions input =
  let matches = input =~ mulPattern :: [[String]]                                   -- Finding all matching mul patterns
  in map extraPairValues matches                                                    -- Extracting value pairs
  where
    mulPattern = "mul\\(([0-9]{1,3}),([0-9]{1,3})\\)"

parseDoMulInstructions :: String -> [(Int, Int)]
parseDoMulInstructions input =
  let matches = input =~ doMulPattern :: [[String]]                                 -- Finding all matching do/don't/mul patterns
      validMatches = fst $ foldl filterMatches ([], True) matches                   -- Filtering out don't mul patterns
  in map extraPairValues validMatches                                               -- Extracting value pairs
  where
    doMulPattern = "(do\\(\\))|(don't\\(\\))|mul\\(([0-9]{1,3}),([0-9]{1,3})\\)"
    filterMatches (validMatches, ok) current =
        case head current of
          "don't()" -> (validMatches, False)                                        -- Stop accepting mul patterns
          "do()" -> (validMatches, True)                                            -- Start accepting mul patterns
          _ -> if ok then (validMatches ++ [current], ok) else (validMatches, ok)   -- Validate mul patterns

extraPairValues :: [String] -> (Int, Int)
extraPairValues xs =
  let values = map (read::String->Int) (drop (length xs - 2) xs)                    -- Keeping only captured pair of values (last in captured groups)
  in (head values, last values)