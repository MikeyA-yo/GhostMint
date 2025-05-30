package circuits

import (
	"github.com/ava-labs/EncryptedERC/pkg/babyjub"
	tedwards "github.com/consensys/gnark-crypto/ecc/twistededwards"
	"github.com/consensys/gnark/frontend"
)

type RegistrationCircuit struct {
	Sender RegistrationSender
}

func (circuit *RegistrationCircuit) Define(api frontend.API) error {
	// Initialize babyjub wrapper
	babyjub := babyjub.NewBjWrapper(api, tedwards.BN254)

	// Verify that the sender's public key is well-formed
	CheckPublicKey(api, babyjub, circuit.Sender)

	// Verify that the sender's registration hash is well-formed
	CheckRegistrationHash(api, circuit.Sender)

	return nil
}
