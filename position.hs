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

positionCashValue :: (Position a) => a -> Float -> Float
positionCashValue p securityValue = positionValue p securityValue -
                                    (positionOpenCost p + positionCloseCost p)

data SharePosition = SharePosition Int Float Float deriving (Show)

sharePosition_numShares :: SharePosition -> Int
sharePosition_numShares (SharePosition numShares _ _) = numShares

sharePosition_openCost :: SharePosition -> Float
sharePosition_openCost (SharePosition _ openCost _) = openCost

sharePosition_closeCost :: SharePosition -> Float
sharePosition_closeCost (SharePosition _ _ closeCost) = closeCost

instance Position SharePosition where
    positionValue p securityValue =
        (fromIntegral (sharePosition_numShares p)) * securityValue
    positionOpenCost p = sharePosition_openCost p
    positionCloseCost p = sharePosition_closeCost p
