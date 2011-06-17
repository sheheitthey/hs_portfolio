-- Calculating positions.
module Position (
    Position
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
