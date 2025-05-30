package poseidon

import "github.com/consensys/gnark/frontend"

// implements poseidon decryption
func poseidonDecrypt(
	api frontend.API,
	decryptedLength int,
	encryptionKey [2]frontend.Variable,
	nonce frontend.Variable,
	cipherText []frontend.Variable,
) []frontend.Variable {
	length := decryptedLength
	for decryptedLength%3 != 0 {
		decryptedLength += 1
	}

	out := make([]frontend.Variable, decryptedLength)

	two128 := frontend.Variable("340282366920938463463374607431768211456")
	api.AssertIsLessOrEqual(nonce, api.Sub(two128, frontend.Variable(1)))

	n := (decryptedLength + 1) / 3

	strategies := make([][]frontend.Variable, n+1)

	strategies[0] = PoseidonEx(
		api,
		[]frontend.Variable{encryptionKey[0], encryptionKey[1], api.Add(nonce, api.Mul(length, two128))},
		0,
		4,
	)

	for i := 0; i < n; i++ {
		for j := 0; j < 3; j++ {
			out[i*3+j] = api.Sub(cipherText[i*3+j], strategies[i][j+1])
		}

		strategiesInput := make([]frontend.Variable, 3)
		for j := 0; j < 3; j++ {
			strategiesInput[j] = cipherText[i*3+j]
		}

		strategies[i+1] = PoseidonEx(
			api,
			strategiesInput,
			strategies[i][0],
			4,
		)
	}

	remainder := length % 3
	if remainder != 0 {
		for i := length; i < decryptedLength; i++ {
			api.AssertIsEqual(out[i], 0)
		}
	}

	// Check the last ciphertext element
	api.AssertIsEqual(cipherText[decryptedLength], strategies[n][1])

	return out[:length]
}

// implements poseidon decryption with 1 decrypted element
func PoseidonDecryptSingle(
	api frontend.API,
	encryptionKey [2]frontend.Variable,
	nonce frontend.Variable,
	cipherText [4]frontend.Variable,
) []frontend.Variable {
	return poseidonDecrypt(api, 1, encryptionKey, nonce, cipherText[:])
}
