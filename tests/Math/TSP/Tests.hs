module Math.TSP.Tests where

import Test.Framework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit
import Test.HUnit hiding (Test)

import Math.TSP

tspSuite :: Test
tspSuite = testGroup "TSP calls"
    [ testCase "null case" (testTSP [] [] [])
    ]

testTSP :: Nodes -> WeightedEdges -> Route -> Assertion
testTSP nodes weightedEdges expected = expected @=? findRoute nodes weightedEdges

main :: IO ()
main = defaultMain
    [ tspSuite
    ]
