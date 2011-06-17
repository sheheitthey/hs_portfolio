-- Calculating positions.
module Position (
    Position(..),
    positionOpenCost,
    positionCloseCost,
    positionValue,
    positionCashValue,
    ComboPosition,
    comboPositionCashValue
) where

data Position =   SharePosition Int     -- numShares
                                Float   -- openCost
                                Float   -- closeCost
                | OptionPosition Int    -- numShares
                                 Float  -- strikePrice
                                 Float  -- openCost
                                 Float  -- closeCost
                deriving (Show)

positionOpenCost :: Position -> Float
positionOpenCost position = case position of
    (SharePosition numShares
                   openCost
                   closeCost) ->
        openCost
    (OptionPosition numShares
                    strikePrice
                    openCost
                    closeCost) ->
        openCost

positionCloseCost :: Position -> Float
positionCloseCost position = case position of
    (SharePosition numShares
                   openCost
                   closeCost) ->
        closeCost
    (OptionPosition numShares
                    strikePrice
                    openCost
                    closeCost) ->
        closeCost

positionValue :: Position -> Float -> Float
positionValue position securityValue = case position of
    (SharePosition numShares
                   openCost
                   closeCost) ->
        (fromIntegral numShares) * securityValue
    (OptionPosition numShares
                    strikePrice
                    openCost
                    closeCost) ->
        max ((fromIntegral numShares) * (securityValue - strikePrice))
            0

positionCashValue :: Position -> Float -> Float
positionCashValue position securityValue =
    let transactionCosts = (positionOpenCost position +
                            positionCloseCost position) in
        positionValue position securityValue - transactionCosts

type ComboPosition = [Position]
comboPositionCashValue comboPosition securityValue =
    foldl (\totalCashValue position ->
               totalCashValue + positionCashValue position securityValue)
          0
          comboPosition
