module Math.TSP where

import qualified Data.Map

data Node = Node { city :: String
                 } deriving (Show, Eq, Ord)
type Nodes = [Node]

data Edge = Edge { origin, destination :: Node
                 } deriving (Show, Eq, Ord)
type Edges = [Edge]

type Weight = Integer

type WeightedEdges = Data.Map.Map Edge Weight

type Route = Nodes
type Routes = [Route]

hasDuplicates :: (Eq a) => [a] -> Bool
hasDuplicates [] = False
hasDuplicates [_] = False
hasDuplicates (x:xs) = if x `elem` xs then True else hasDuplicates xs

areSameNodes :: Edge -> Bool
areSameNodes (Edge e e') = e == e'

areAnySameNodes :: Edges -> Bool
areAnySameNodes edges = and $ map (areSameNodes) edges

findEdges :: Route -> Edges
findEdges [] = []
findEdges [_] = []
findEdges (x1:x2:xs) = (Edge x1 x2):(findEdges (x2:xs))

weightOfEdge :: WeightedEdges -> Edge -> Weight
weightOfEdge weightedEdges edge = weightedEdges Data.Map.! edge

weightOfEdges :: WeightedEdges -> Edges -> Weight
weightOfEdges weightedEdges edges = sum $ map (weightOfEdge weightedEdges) edges

weightOfRoute :: WeightedEdges -> Route -> Weight
weightOfRoute weightedEdges route = weightOfEdges weightedEdges $ findEdges route

--arbitrary choice
findRoute :: Nodes -> WeightedEdges -> Route
findRoute nodes weightedEdges = nodes

{-
findRoute :: Nodes -> WeightedEdges -> Route
findRoute [] [] = []
findRoute [] _ = error "Nodes with no edges"
findRoute _ [] = error "Edges with no nodes"
findRoute nodes weightedEdges
  | hasDuplicates nodes = error "Duplicate nodes"
  | hasDuplicates $ map edge weightedEdges = error "Duplicate edges"
  | areAnySameNodes weightedEdges = error "Do not include edges which return to themselves (cost is assumed to be 0)"
  | otherwise = undefined
-}
