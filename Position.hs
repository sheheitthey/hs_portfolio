module Position (
    Position,
    positionValue,
    positionOpenCost,
    positionCloseCost,
    positionCashValue
) where
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
