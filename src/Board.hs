module Board
  ( Board
  , makeBoard
  , allBoardSpots
  , markBoard
  , isSpotOpen
  , getAvailableSpots
  , getBoardValues
  ) where

import qualified Data.Map as Map

type Board = Map.Map String String

allBoardSpots :: [String]
allBoardSpots =
  map show [1 :: Int .. 9]

makeBoard :: Board
makeBoard =
  Map.fromList $ zip allBoardSpots (repeat "")

markBoard :: Board -> String -> String -> Board
markBoard gameBoard spot marker =
  Map.alter f spot gameBoard
  where f _  = (Just marker)

isSpotOpen :: Board -> String -> Bool
isSpotOpen gameBoard spot =
  Map.member spot gameBoard && null (getSpotValue gameBoard spot)

getBoardValues :: Board -> [String] -> [String]
getBoardValues gameBoard boardSpots =
  map (Board.getSpotValue gameBoard) boardSpots

getAvailableSpots :: Board -> [String]
getAvailableSpots gameBoard =
  Map.keys $ Map.filter null gameBoard

getSpotValue :: Board -> String -> String
getSpotValue gameBoard spot =
  gameBoard Map.! spot
