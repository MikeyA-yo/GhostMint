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

contract MintVerifier {
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
    uint256 constant deltax1 = 6506135815943976343670204718908252778100436948044695952269504614489235747522;
    uint256 constant deltax2 = 12917761706367159448552669332158549008424338800753983174002760426851264899916;
    uint256 constant deltay1 = 21054759061354342502671069523347944444365476693281335142489232816218318279843;
    uint256 constant deltay2 = 921807516250667254679639816527091672038652453691410152532432179406742682074;

    
    uint256 constant IC0x = 10121904041541460154551260390411876526139574666949788432677764574044027742051;
    uint256 constant IC0y = 6395114105467352463516423639828272877440036954754220055848039516989817256674;
    
    uint256 constant IC1x = 5586762719201810155133862083740714325655748243483738877755810028542797644739;
    uint256 constant IC1y = 9387879719287370926595730382657598610335084850078203728936667449453246554359;
    
    uint256 constant IC2x = 19420434315212518030589186167981244595406343548992012458488730749825996100239;
    uint256 constant IC2y = 3482657374383353276279298693752239555763142972311841530862645391131143881873;
    
    uint256 constant IC3x = 21667521945257749121492909465236139091096077691835364325355606431375269082282;
    uint256 constant IC3y = 12156175257782822331801928906256367913221851960540994586932487722549923413345;
    
    uint256 constant IC4x = 16828357126590671631798447095302651492589140460428270542352941484237941156483;
    uint256 constant IC4y = 3785759973408012513975276660945174958105045591429994983968533282503371539336;
    
    uint256 constant IC5x = 21244321325522105477060254124915502034148248502931960755663601081500950076300;
    uint256 constant IC5y = 14687177467139662957844534389099557537735007475047254307829149459337997284150;
    
    uint256 constant IC6x = 21404447565616225355770439075122853382066792760583316781611395109968504614761;
    uint256 constant IC6y = 3777910210505077428584254669424713454396973987622630869249106067166590299357;
    
    uint256 constant IC7x = 5644690004940482546460856256670502914882531219591199090065888636589494736039;
    uint256 constant IC7y = 16345970805899097192278870928687506101715169625232631539981164972434652655022;
    
    uint256 constant IC8x = 16593367704572145491497340027058421406291597779030039134573703992464863830646;
    uint256 constant IC8y = 19275772679724763916884927502599327291258343548738975909520313332884772129528;
    
    uint256 constant IC9x = 18338635157990571739660769292280252719367811451620901782236478705200001456515;
    uint256 constant IC9y = 12580365946981294431067603413481570211192375767222833113101936660967490853342;
    
    uint256 constant IC10x = 19880773599746588943745194809450382516728304373879942615347513263173728275196;
    uint256 constant IC10y = 128548754750873577554444615682746852358621588347676854260473817368140033519;
    
    uint256 constant IC11x = 6476719107464483530164368276818653110527411272303410163053488615734788766586;
    uint256 constant IC11y = 13331539055996208679678758084320772815107338352425913859433335410845899223811;
    
    uint256 constant IC12x = 17393436839515851750885277096607160266036302533767007170590322671069079326483;
    uint256 constant IC12y = 17336491525577930609097646312281682071744277090982994234361498925040239739760;
    
    uint256 constant IC13x = 14059139663320156276001577403575266145309546640724899667521029234074221180403;
    uint256 constant IC13y = 5963232262834884334488206091864494084893490405377454589196552297795638041488;
    
    uint256 constant IC14x = 13813470258321934033051704279698252148783024920181797002453328082368105474789;
    uint256 constant IC14y = 19760333797981660449134124218356560284106192590380149679255903109561686546313;
    
    uint256 constant IC15x = 11858117840318587547791069185551586430435948995333725070770764697634898894992;
    uint256 constant IC15y = 16621799951101200543458233987158204772158254202860685491749532125765298740749;
    
    uint256 constant IC16x = 13584356250500421508084566767718022822120888453124821650989966819848963029582;
    uint256 constant IC16y = 21121442557480691564262522113115528175177021588076736568194595390503813944019;
    
    uint256 constant IC17x = 4326226245481542040767942040881999777137473163343274779447151141265545792486;
    uint256 constant IC17y = 21183580388477113613358837765893868421637670220571970210021457037640835173809;
    
    uint256 constant IC18x = 2704745980008452624320271214496436840853635777289985169457654318338905712053;
    uint256 constant IC18y = 5498942242451865915343845370075402718280213375705928811712272696867696623122;
    
    uint256 constant IC19x = 18021323881247358977456866382503667963535769536490271165761105041938333860259;
    uint256 constant IC19y = 15056011404667104875167366478630077579580289596849055349190254216447781136049;
    
    uint256 constant IC20x = 2428670635260390602473903592482933886252233168437493591205178349351514000281;
    uint256 constant IC20y = 862350060646299115005420081148519933461348146447694025974629367115211964519;
    
    uint256 constant IC21x = 20557922324599650576215164022162024912213509843003042307546636524489843547931;
    uint256 constant IC21y = 1061522392679391742130691544383963509531829000498209937975610885874122363387;
    
    uint256 constant IC22x = 9114256858842496488535186312068922854228150055952688114444862375910254881995;
    uint256 constant IC22y = 20868937436899006110617091404782344741103549613810098330797141428653796030423;
    
    uint256 constant IC23x = 392332888128429361037702708407695212788446855280618226506466973682041689462;
    uint256 constant IC23y = 10986782868722900357976121669302445297980271976862420955075995610762868745084;
    
    uint256 constant IC24x = 12335561474727855982123382035622477594232361573497391299243618736725476900631;
    uint256 constant IC24y = 20340286770637453607265533856091115758478742882346824576410498508028320071146;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[24] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                

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
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
