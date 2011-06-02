module OptionPosition (
    OptionPosition(..)
) where

import Position

data OptionPosition = OptionPosition {
    numShares :: Int,
    strikePrice :: Float,
    openCost :: Float,
    closeCost :: Float
} deriving (Show)

instance Position OptionPosition where
    positionValue p securityValue =
        max ((fromIntegral (numShares p)) *
             (securityValue - (strikePrice p)))
            0

    positionOpenCost p = openCost p

    positionCloseCost p = closeCost p
