package circuits

import (
	"github.com/ava-labs/EncryptedERC/pkg/babyjub"
	"github.com/ava-labs/EncryptedERC/pkg/poseidon"
	"github.com/consensys/gnark/frontend"
)

// KeyHolder is an interface for any type that has a private key and public key
type KeyHolder interface {
	GetPrivateKey() frontend.Variable
	GetPublicKeyX() frontend.Variable
	GetPublicKeyY() frontend.Variable
}

/*
CheckPublicKey checks if the given private key generates the given public key over the BabyJubjub curve
*/
func CheckPublicKey(api frontend.API, bj *babyjub.BjWrapper, keyHolder KeyHolder) {
	api.AssertIsLessOrEqual(keyHolder.GetPrivateKey(), api.Sub(bj.BasePointOrder, 1))

	generatedPublicKey := bj.MulWithBasePoint(keyHolder.GetPrivateKey())
	bj.AssertPoint(generatedPublicKey, keyHolder.GetPublicKeyX(), keyHolder.GetPublicKeyY())
}

/*
CheckPublicKey checks if the given private key generates the given public key over the BabyJubjub curve
*/
func CheckRegistrationPublicKey(api frontend.API, bj *babyjub.BjWrapper, sender RegistrationSender) {
	api.AssertIsLessOrEqual(sender.PrivateKey, api.Sub(bj.BasePointOrder, 1))

	generatedSenderPublicKey := bj.MulWithBasePoint(sender.PrivateKey)
	bj.AssertPoint(generatedSenderPublicKey, sender.PublicKey.P.X, sender.PublicKey.P.Y)
}

/*
CheckBalance checks if the sender's balance is a well-formed ElGamal ciphertext by decryption
*/
func CheckBalance(api frontend.API, bj *babyjub.BjWrapper, sender Sender) {
	api.AssertIsLessOrEqual(sender.Balance, api.Sub(bj.BasePointOrder, 1))

	decSenderBalanceP := bj.ElGamalDecrypt([2]frontend.Variable{sender.BalanceEGCT.C1.X, sender.BalanceEGCT.C1.Y}, [2]frontend.Variable{sender.BalanceEGCT.C2.X, sender.BalanceEGCT.C2.Y}, sender.PrivateKey)
	givenSenderBalanceP := bj.MulWithBasePoint(sender.Balance)
	bj.AssertPoint(givenSenderBalanceP, decSenderBalanceP.X, decSenderBalanceP.Y)
}

/*
CheckPositiveValue verifies if the sender's value is the encryption of the given value by decryption
*/
func CheckPositiveValue(api frontend.API, bj *babyjub.BjWrapper, sender Sender, value frontend.Variable) {
	api.AssertIsLessOrEqual(value, api.Sub(bj.BasePointOrder, 1))

	positiveValueP := bj.MulWithBasePoint(value)
	decSenderValueP := bj.ElGamalDecrypt([2]frontend.Variable{sender.ValueEGCT.C1.X, sender.ValueEGCT.C1.Y}, [2]frontend.Variable{sender.ValueEGCT.C2.X, sender.ValueEGCT.C2.Y}, sender.PrivateKey)
	bj.AssertPoint(positiveValueP, decSenderValueP.X, decSenderValueP.Y)
}

/*
CheckValue verifies if the receiver's value is the encryption of the given value by re-encrypting it and comparing the result with the given ciphertext
*/
func CheckValue(api frontend.API, bj *babyjub.BjWrapper, receiver Receiver, value frontend.Variable) {
	api.AssertIsLessOrEqual(value, api.Sub(bj.BasePointOrder, 1))

	api.AssertIsLessOrEqual(receiver.ValueRandom.R, api.Sub(bj.BasePointOrder, 1))

	reEncC1, reEncC2 := bj.ElGamalEncrypt(receiver.PublicKey.P, bj.MulWithBasePoint(value), receiver.ValueRandom.R)
	bj.AssertPoint(receiver.ValueEGCT.C1, reEncC1.X, reEncC1.Y)
	bj.AssertPoint(receiver.ValueEGCT.C2, reEncC2.X, reEncC2.Y)
}

/*
CheckPCTReceiver verifies if the given receiver's Poseidon ciphertext is well-formed by re-encryption
*/
func CheckPCTReceiver(api frontend.API, bj *babyjub.BjWrapper, receiver Receiver, value frontend.Variable) {
	api.AssertIsLessOrEqual(receiver.PCT.Random, api.Sub(bj.BasePointOrder, 1))

	poseidonAuthKey := bj.MulWithBasePoint(receiver.PCT.Random)
	bj.AssertPoint(poseidonAuthKey, receiver.PCT.AuthKey.X, receiver.PCT.AuthKey.Y)

	// r * pk
	poseidonEncryptionKey := bj.MulWithScalar(receiver.PublicKey.P.X, receiver.PublicKey.P.Y, receiver.PCT.Random)
	// Decrypt the ciphertext
	decrypted := poseidon.PoseidonDecryptSingle(api, [2]frontend.Variable{poseidonEncryptionKey.X, poseidonEncryptionKey.Y}, receiver.PCT.Nonce, receiver.PCT.Ciphertext)

	api.AssertIsEqual(decrypted[0], value)

}

/*
CheckPCTAuditor verifies if the given auditor's Poseidon ciphertext is well-formed by re-encryption
*/
func CheckPCTAuditor(api frontend.API, bj *babyjub.BjWrapper, auditor Auditor, value frontend.Variable) {
	api.AssertIsLessOrEqual(auditor.PCT.Random, api.Sub(bj.BasePointOrder, 1))

	poseidonAuthKey := bj.MulWithBasePoint(auditor.PCT.Random)
	bj.AssertPoint(poseidonAuthKey, auditor.PCT.AuthKey.X, auditor.PCT.AuthKey.Y)

	// r * pk
	poseidonEncryptionKey := bj.MulWithScalar(auditor.PublicKey.P.X, auditor.PublicKey.P.Y, auditor.PCT.Random)

	// Decrypt the ciphertext
	decrypted := poseidon.PoseidonDecryptSingle(api, [2]frontend.Variable{poseidonEncryptionKey.X, poseidonEncryptionKey.Y}, auditor.PCT.Nonce, auditor.PCT.Ciphertext)
	api.AssertIsEqual(decrypted[0], value)
}

/*
CheckRegistrationHash verifies if the given registration hash is well-formed
*/
func CheckRegistrationHash(api frontend.API, sender RegistrationSender) {
	pos := poseidon.NewPoseidonHash(api)
	hash := poseidon.Hash3(pos, sender.ChainID, sender.PrivateKey, sender.Address)
	api.AssertIsEqual(hash, sender.RegistrationHash)
}

/*
CheckNullifierHash verifies if the given nullifier hash is well-formed
*/
func CheckNullifierHash(api frontend.API, auditor Auditor, nullifier MintNullifier) {
	pos := poseidon.NewPoseidonHash(api)
	hash := poseidon.CalculateNullifierHash(pos, nullifier.ChainID, auditor.PCT.Ciphertext[:])
	api.AssertIsEqual(hash, nullifier.NullifierHash)
}

func (s Sender) GetPrivateKey() frontend.Variable {
	return s.PrivateKey
}

func (s Sender) GetPublicKeyX() frontend.Variable {
	return s.PublicKey.P.X
}

func (s Sender) GetPublicKeyY() frontend.Variable {
	return s.PublicKey.P.Y
}

func (s RegistrationSender) GetPrivateKey() frontend.Variable {
	return s.PrivateKey
}

func (s RegistrationSender) GetPublicKeyX() frontend.Variable {
	return s.PublicKey.P.X
}

func (s RegistrationSender) GetPublicKeyY() frontend.Variable {
	return s.PublicKey.P.Y
}
