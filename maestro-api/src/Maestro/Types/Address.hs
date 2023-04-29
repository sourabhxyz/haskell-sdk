module Maestro.Types.Address where

import           Deriving.Aeson
import           Maestro.Types.Common (MaestroAsset, MaestroDatum,
                                       MaestroRefScript)

data AddressUtxo = AddressUtxo
  { _addressUtxoIndex           :: !Int
  , _addressUtxoTxHash          :: !String
  , _addressUtxoAssets          :: ![MaestroAsset]
  , _addressUtxoDatum           :: !(Maybe MaestroDatum)
  , _addressUtxoReferenceScript :: !(Maybe MaestroRefScript)
  }
  deriving stock (Show, Eq, Generic)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier '[StripPrefix "_addressUtxo", CamelToSnake]] AddressUtxo

newtype AddressTxCount  = AddressTxCount
  { _addressTxCount :: Int
  }
  deriving stock (Show, Eq, Generic)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier '[StripPrefix "_addressTx", CamelToSnake]] AddressTxCount

data AddressUtxoRef = AddressUtxoRef
  { _addressUtxoRefIndex  :: !Int
  , _addressUtxoRefTxHash :: !String
  }
  deriving stock (Show, Eq, Generic)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier '[StripPrefix "_addressUtxoRef", CamelToSnake]] AddressUtxoRef
