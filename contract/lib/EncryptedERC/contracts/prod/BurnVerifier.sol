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

contract BurnVerifier {
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
    uint256 constant deltax1 = 20500123508036250241732436039045855491142840147741568076165900093824331281316;
    uint256 constant deltax2 = 17951494579165795533532847235529611089521789751209994758862962564682445617412;
    uint256 constant deltay1 = 5834387578477044714458263369208539598498352288497332887384107712494722576583;
    uint256 constant deltay2 = 15268404118840851015046775717571916089738924216088942953684197626467386210997;

    
    uint256 constant IC0x = 11786268729161045937652164714990691490770027441460947932012316631529733292940;
    uint256 constant IC0y = 9581132102330540074693305331254898451475664668584360899026097918947512977366;
    
    uint256 constant IC1x = 914822366018062648285730205402683692599853766866159406178623354781735659599;
    uint256 constant IC1y = 8553697750564092712813746981763759579862680918228138684307182805192139236520;
    
    uint256 constant IC2x = 17908121343774581376092646765067170799970925894057937307165335210962871507135;
    uint256 constant IC2y = 6739483966006459958647545663755815825611388802168101513616676265213547687212;
    
    uint256 constant IC3x = 143359351657650308208480824138891765346610788279862658068353643164441844115;
    uint256 constant IC3y = 1688658345879791302522420761526578526163188876279486731177660400972657648742;
    
    uint256 constant IC4x = 18309718863517978042660293994537440591428742486455947599492279373595114219500;
    uint256 constant IC4y = 3543366565414834921232477531525858456841505305202548147687587105557694958104;
    
    uint256 constant IC5x = 2179968961403977829543241099157331775731416225717055667057125732267317798366;
    uint256 constant IC5y = 14579564811228528586131093319854876770716135551807922280189147940915226636750;
    
    uint256 constant IC6x = 12128037778350917133400346467296434075039661406517118820895803963198786951800;
    uint256 constant IC6y = 12810377956478161485381774828600271058686148075894654796038454545352947160776;
    
    uint256 constant IC7x = 9593873745453136272405518724864540111195676150385738265238288297101461351389;
    uint256 constant IC7y = 18140226050853380485925948980064648409518762214351351505488025177062130412015;
    
    uint256 constant IC8x = 5344462067192893979551241744484644250693230460027867247351105468329395690915;
    uint256 constant IC8y = 2435072349815413116277252545573449685604686772441816336584542983683379409914;
    
    uint256 constant IC9x = 15867459271796662494529143386082298582993967528167005628586571617103329782767;
    uint256 constant IC9y = 1031216327552632558464991513003642749331915406636029936411939647607628738052;
    
    uint256 constant IC10x = 11710830742293210758218398274130454937288722189717294688374583983853957500247;
    uint256 constant IC10y = 18095934287133238566717320534781010028273178446261522698705303702525394211898;
    
    uint256 constant IC11x = 5451223849987641096615559250356903902465481513182931751171182631482949381911;
    uint256 constant IC11y = 6791511973211811945927811502706661666842895298126970397039460184655612620453;
    
    uint256 constant IC12x = 12576390828389735220141209658777087276380270144557056528857559882798323629447;
    uint256 constant IC12y = 19191122649652045476856774223103624470066531140701020233373995430155185392289;
    
    uint256 constant IC13x = 3208115974817470421120218397409974778673673537533531169452261659740974257278;
    uint256 constant IC13y = 1563495302870822079389756646952495877672019554537528044396737285924026906103;
    
    uint256 constant IC14x = 15803266454704411593372706477399336420388826076293995292354385277988446601281;
    uint256 constant IC14y = 14061261779941396671642560007918916383355024387096318566313366433584709024499;
    
    uint256 constant IC15x = 1473892103720096233092115851822223251992401285317974909943916318348184767365;
    uint256 constant IC15y = 3670020837101119839757171869792531530222770849398108379916390350369899561438;
    
    uint256 constant IC16x = 8909686676336745813415338575513600352109241710831786249590248291624151036333;
    uint256 constant IC16y = 4561980313802046241453616743996179799784948333408123666456078054975402233930;
    
    uint256 constant IC17x = 9644420134970614917918276763660740255881705883613568754990717610748161142338;
    uint256 constant IC17y = 6057246608400625128574045490366205109267182635495031148770746354579442521952;
    
    uint256 constant IC18x = 3478588600416828411411103709929443364350875935722379535054531373495869197302;
    uint256 constant IC18y = 14312139497598775136457694532354226575027823182198251149840842365373433448408;
    
    uint256 constant IC19x = 16478469522390352876826812932849485876750021274758447084770343652372421581875;
    uint256 constant IC19y = 5525105724620928136283079314841429313946285054350434613540639344526895834484;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[19] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                

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
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
