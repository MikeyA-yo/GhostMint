// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract WithdrawVerifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 17937261609492175473978423283366042492782788118934277743325590061927472686823;
    uint256 constant deltax2 = 9134393277137786117877602562175203472042554058536880581948679621094751253663;
    uint256 constant deltay1 = 21830579691680039608885512644157042138865859432216493093304779889887319651703;
    uint256 constant deltay2 = 13560247966092290370160513680671248860780213214350811711788627488150106599867;

    
    uint256 constant IC0x = 17592896514411238838534259943087906039445412467749501855660552694930011809103;
    uint256 constant IC0y = 12732983330708765219970549274392016128270173019293005848551474757324971194427;
    
    uint256 constant IC1x = 4884577932082347864149139524102040008488705064603684844915539314596644874132;
    uint256 constant IC1y = 5456447315604083878474265800827509892021228387863831389892962189069605516459;
    
    uint256 constant IC2x = 17313454373712045907554165434725963402117845429222578159130609582778779362163;
    uint256 constant IC2y = 4407461008783085705651216674025467181197484228135456843989535495240785812495;
    
    uint256 constant IC3x = 10893636774628876142899763192646905724708189468282917758613650147010478133301;
    uint256 constant IC3y = 148896310776292842756025446759984436974180847194558332931999839598427070960;
    
    uint256 constant IC4x = 10775675593870925743575084889624246391515781987722804772444693341240701433005;
    uint256 constant IC4y = 21091396295200083161363697039830865943762788335711072967082811732416412142212;
    
    uint256 constant IC5x = 3277805223442060778292405741942548007218490041051348547437304074109624107356;
    uint256 constant IC5y = 14423944753390168508001610935122911632893435927783118919600891838924075393335;
    
    uint256 constant IC6x = 16279740598746831017838829127065220413108847820004536437353222843036288927209;
    uint256 constant IC6y = 11934056246616513677892280054066225650223628502415902228226616908265848867449;
    
    uint256 constant IC7x = 5071131858486439523644545889310168311903353944707113398976996997278587799687;
    uint256 constant IC7y = 11022965843210062064457659632129711893317662131236104884153566306811626505122;
    
    uint256 constant IC8x = 19131780283367531273448020668619041357172962162156115675741827445246630873287;
    uint256 constant IC8y = 10224436589841763650559926912214172567856653421053590774767009207269607380898;
    
    uint256 constant IC9x = 9015890207964856811111785067351720194541561850029096381425406768947368358563;
    uint256 constant IC9y = 6047643904429654109574184105636835293535463759429215740849034643735922891159;
    
    uint256 constant IC10x = 14203417831592538293633573944212232646895161398477212007798306234115933198031;
    uint256 constant IC10y = 16402598342815946882326203254821041228554468765346033642071484587006914175418;
    
    uint256 constant IC11x = 20547058030012031602382050197843576579725635037139342207584317836070120910810;
    uint256 constant IC11y = 18032163858711245709516724511475426102219042616668426511217798974437856519723;
    
    uint256 constant IC12x = 148439843878200889608411203087042067351611646430696078100079098168514978714;
    uint256 constant IC12y = 9307113381205316554384865850704068163340346564569932871492676068849222362101;
    
    uint256 constant IC13x = 21753481289618352374517009260504147501427757590648179575845005895425333005720;
    uint256 constant IC13y = 15435923224398640375717587240417911857458317269020496236194087111795302601904;
    
    uint256 constant IC14x = 15556836099875422007583907774078621468033908465380872159150755233143098695951;
    uint256 constant IC14y = 1129744811704326861736580949783332840905388382080396668503461990830533174097;
    
    uint256 constant IC15x = 13442230315665714018082790733663853073869607935268797374915472095839891294991;
    uint256 constant IC15y = 6217288894318109502763318183559473125294772219565374069029777927475585687108;
    
    uint256 constant IC16x = 13992512973627636194543618755294557224102658899504040367095379192332931057711;
    uint256 constant IC16y = 5489859536562727184655955989301069690715491550780438666774255315815483859767;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[16] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
