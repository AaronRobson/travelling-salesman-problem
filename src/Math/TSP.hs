module Math.TSP where

data Location = Location { address :: String
                         } deriving (Show, Eq)

type Locations = [Location]

data Salesman = Salesman { name :: String
                         } deriving (Show, Eq)
type Salesmen = [Salesman]

data Path = Path { salesman :: Salesman
                 , pathLocations :: Locations
                 } deriving (Show, Eq)
type Paths = [Path]

data Graph = Graph { locations :: Locations
                   , salesmen :: Salesmen
                   } deriving (Show, Eq)

findPaths :: Graph -> Maybe Paths
findPaths Graph {locations = [], salesmen = []} = Just []
findPaths (Graph {locations = [], salesmen = _}) = Nothing
findPaths (Graph {locations = _, salesmen = []}) = Nothing
findPaths _ = undefined
