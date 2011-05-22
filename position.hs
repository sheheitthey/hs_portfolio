-- Calculating positions.

class Position a where
    -- positionValue(Position p, Float securityValue)
    positionValue :: a -> Float -> Float

    -- positionOpenCost(Position p)
    positionOpenCost :: a -> Float

    -- positionCloseCost(Position p)
    positionCloseCost :: a -> Float

data LongPosition = LongPosition Int Float Float deriving (Show)

longPosition_numShares :: LongPosition -> Int
longPosition_numShares (LongPosition numShares _ _) = numShares

longPosition_openCost :: LongPosition -> Float
longPosition_openCost (LongPosition _ openCost _) = openCost

longPosition_closeCost :: LongPosition -> Float
longPosition_closeCost (LongPosition _ _ closeCost) = closeCost

instance Position LongPosition where
    positionValue p securityValue =
        (fromIntegral (longPosition_numShares p)) * securityValue
    positionOpenCost p = longPosition_openCost p
    positionCloseCost p = longPosition_closeCost p
