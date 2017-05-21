module Math.TSP.Tests where

import Test.Framework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit
import Test.HUnit hiding (Test)

import Math.TSP

tspSuite :: Test
tspSuite = testGroup "TSP calls"
    [ testCase "null case" (testTSP (Graph {locations = [], salesmen = []}) (Just []))
    ]

testTSP :: Graph -> Maybe Paths -> Assertion
testTSP argument expected = expected @=? findPaths argument

main :: IO ()
main = defaultMain
    [ tspSuite
    ]
