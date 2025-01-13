{-# language OverloadedStrings #-}

module Main where
  
    import Graphics.Vega.VegaLite hiding (Sum)
    import Prelude hiding (filter, lookup, repeat)

    plot :: IO ()
    plot =
        let x = [40.0, 40.004 .. 41.0]
            y = map (\n -> n**10 + 1 - n**10) x
            plotData = dataFromColumns []
                . dataColumn "x" (Numbers x)
                . dataColumn "y" (Numbers y)
                $ []
            enc = encoding
                . position X [PName "x", PmType Quantitative]
                . position Y [PName "y", PmType Quantitative, PScale [SDomain (DNumbers [-0.5, 2.5])]]
                $ []
        in toHtmlFile "plot3.html" $ toVegaLite [plotData, mark Line [], enc, height 600, width 800]

    main :: IO()
    main = plot