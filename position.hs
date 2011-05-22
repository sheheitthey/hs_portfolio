-- Calculating positions.

class Position a where
    -- positionValue(Position p, Float securityValue)
    positionValue :: a -> Float -> Float

    -- positionOpenCost(Position p)
    positionOpenCost :: a -> Float

    -- positionCloseCost(Position p)
    positionCloseCost :: a -> Float

{- Hmm, it might not make sense to associate open/close costs with individual
   positions. For example, if commision is a fixed cost C per trade, the close
   cost of 100 shares + 100 shares of the same security is just C, not 2*C.
-}

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
