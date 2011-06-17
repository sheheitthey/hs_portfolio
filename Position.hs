module Position (
    Position
) where
-- Calculating positions.

data Position =   SharePosition Int     -- numShares
                                Float   -- openCost
                                Float   -- closeCost
                | OptionPosition Int    -- numShares
                                 Float  -- strikePrice
                                 Float  -- openCost
                                 Float  -- closeCost
                deriving (Show)
