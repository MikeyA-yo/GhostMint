// (c) 2025, Ava Labs, Inc. All rights reserved.
// See the file LICENSE for licensing terms.

// SPDX-License-Identifier: Ecosystem

pragma solidity 0.8.27;

interface IEncryptedERC {
    /**
     * @notice Sets the balance percentage for a user and token.
     * @param user User address
     * @param tokenId Token ID
     * @param pct Balance percentage array
     * @dev Only the registrar can set the balance percentage
     */
    function setUserBalancePCT(
        address user,
        uint256 tokenId,
        uint256[7] memory pct
    ) external;
}
