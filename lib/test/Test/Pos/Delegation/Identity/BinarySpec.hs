-- | This module tests Binary instances for 'Pos.Delegation' types.

module Test.Pos.Delegation.Identity.BinarySpec
       ( spec
       ) where

import           Universum

import           Test.Hspec (Spec, describe)

import           Pos.Arbitrary.Delegation ()
import           Pos.Arbitrary.Infra ()
import           Pos.Communication.Types.Relay (DataMsg (..))
import           Pos.Core (ProxySKHeavy)
import           Pos.Delegation (DlgPayload, DlgUndo)

import           Test.Pos.Configuration (withDefConfiguration)
import           Test.Pos.Helpers (binaryTest)

spec :: Spec
spec = withDefConfiguration $ describe "Delegation types" $ do
    describe "Bi instances" $ do
        binaryTest @DlgPayload
        binaryTest @DlgUndo
    describe "Network" $ do
        binaryTest @(DataMsg ProxySKHeavy)
