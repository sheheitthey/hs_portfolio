module SharePosition (
    SharePosition(..)
) where

import Position

data SharePosition = SharePosition {
    numShares :: Int,
    openCost :: Float,
    closeCost :: Float
} deriving (Show)

instance Position SharePosition where
    positionValue p securityValue =
        (fromIntegral (numShares p)) * securityValue

    positionOpenCost p = openCost p

    positionCloseCost p = closeCost p
