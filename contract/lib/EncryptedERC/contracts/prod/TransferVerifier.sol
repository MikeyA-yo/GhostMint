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

contract TransferVerifier {
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
    uint256 constant deltax1 = 3763145489265154227084511171694601212878632438189047805035774181671200721579;
    uint256 constant deltax2 = 19123758782558680960137049284286660834755919438304772090386326942336280507607;
    uint256 constant deltay1 = 2055449651368268424611099662557640196156614451951214953872156041652270884888;
    uint256 constant deltay2 = 4894238513642303098263860622238471992887790214981922367145986542927713649242;

    
    uint256 constant IC0x = 10534947708174160215201992304779041355498470735561003306499717122566742770626;
    uint256 constant IC0y = 977905257499899758791217822505228003462337033122097368830210745360601555342;
    
    uint256 constant IC1x = 3280711512314934753992505317526746468153049821370324146752079659712174232300;
    uint256 constant IC1y = 9336028462433315123867796333994191785575550026414826950323988687234821492567;
    
    uint256 constant IC2x = 15162904757480315297547642942646568889101029164132171480256830884259150251283;
    uint256 constant IC2y = 5543236365374398176471504758808152977042933422387633848583378303299793270756;
    
    uint256 constant IC3x = 6084599581719503190421548874454410642759752303455385862653438619168850972257;
    uint256 constant IC3y = 18221408640134590893699663063879232072826509494821669770579541736533993832423;
    
    uint256 constant IC4x = 13515294784299896617263177420364080405138679960108803709127908717931838641125;
    uint256 constant IC4y = 18537954088397403593567974022084871913708328503334967617431436055023979447391;
    
    uint256 constant IC5x = 18052165982957660268255521614825223786335394780677647206458385784232406504157;
    uint256 constant IC5y = 15194585058280412021740640814141568454746627730826424655106679430538982053654;
    
    uint256 constant IC6x = 6795673837897345581582685299965371845759418273539377917021912839836254998739;
    uint256 constant IC6y = 21657993441803516491832636271681043591945604671357149970048825080204553686618;
    
    uint256 constant IC7x = 11289069591450532499401972724447572002376453520281915368481681110785600567292;
    uint256 constant IC7y = 11928539623033527208857415982521538988739084305734749009299860340216923817607;
    
    uint256 constant IC8x = 21069306450658538733134282147277445263698906490240400327689099847099016892805;
    uint256 constant IC8y = 17386225215792739261329655602621235879743955668381844924635942683420074576174;
    
    uint256 constant IC9x = 14345437456753227245495940686700720956058390526322202366808609527984033660993;
    uint256 constant IC9y = 20783457650276182735214466418096310752840639854110597710747660731724327511323;
    
    uint256 constant IC10x = 4486441340824192164364882510367580608217147444088109552210786362403055241932;
    uint256 constant IC10y = 16553383197162304205323300390384875515644589603157855319848881923653657055218;
    
    uint256 constant IC11x = 7299849271075286253602519481881832740498497504048928918662655218108429284825;
    uint256 constant IC11y = 21860902462897801250346538563498742432578812847135047747638191825760100188844;
    
    uint256 constant IC12x = 20812311364493619358550828916571084941809811622004047558332288367068444292636;
    uint256 constant IC12y = 12016931719373400562450857278580603432222260403491989130190760226223433669838;
    
    uint256 constant IC13x = 5497135883066110411842507436361453534364438777740194801977407015457789050083;
    uint256 constant IC13y = 960289848958742655061746467902157315103658957325800360115467733778920704760;
    
    uint256 constant IC14x = 5231929274251912956972062967045818685875910122905492872577246977634648737843;
    uint256 constant IC14y = 2405680064306334170931852015314781533305421897621973941278348820986549273557;
    
    uint256 constant IC15x = 14432423838507076163732475853088150200901869051870980078541847122928808702858;
    uint256 constant IC15y = 13162477912034036392091090217125050953003275307601447359448369192560307791075;
    
    uint256 constant IC16x = 6035380084134788387796489655621652133939237219692536713085830198890102531157;
    uint256 constant IC16y = 2399413675745655961934247765244583346698339793807331712093749883838255391396;
    
    uint256 constant IC17x = 1755840344064269003982904724784588829875883176859314530482477354204358128073;
    uint256 constant IC17y = 2254035658088032093438783815005800506175183609989063203400053587352866305963;
    
    uint256 constant IC18x = 10798890848385583150817432575812471927781281538956290209396088794995757251699;
    uint256 constant IC18y = 17954866604704083608550796134404236420626288308545111154506695506614087706302;
    
    uint256 constant IC19x = 16347505387353659907142234702135154337293088908179815677326286365566466652892;
    uint256 constant IC19y = 8145400935245335001708439352534792707071085106081878093341920760316939810339;
    
    uint256 constant IC20x = 1675146216777597460950545026188423914140684419320163593588767283439513220964;
    uint256 constant IC20y = 3350896492191726464487860464991880712916569207980460035951208489640794805493;
    
    uint256 constant IC21x = 14963360443843679002951981438607054782948196458205149005110445616986857962149;
    uint256 constant IC21y = 5453682123596332752358242170390357649813170313370080322693195792615766005582;
    
    uint256 constant IC22x = 15857139261281078612816698520673496528634524033018907015066869560007114561368;
    uint256 constant IC22y = 1980632957785357477112204530352463186795117003870653324765557649080191593069;
    
    uint256 constant IC23x = 16478788219117512612181000397725550334291930466463033672428118170129909755975;
    uint256 constant IC23y = 448496014898525130300582250347934155241571361910686004171961088395557906873;
    
    uint256 constant IC24x = 1666825517524796314004984207461413135984918930374439646195676102947777182322;
    uint256 constant IC24y = 4231769516076965497747593863600552237823540573882692739018851158660080939768;
    
    uint256 constant IC25x = 3076619425752586210204729303861073992338095413231945893603783564036991027253;
    uint256 constant IC25y = 18163258048301667325957382686787210971933697470347155712452125397431467657627;
    
    uint256 constant IC26x = 12240984649194028123658663640999248201069935674255565459899301410323450592735;
    uint256 constant IC26y = 7409006959659622318645744477945350299438380296542336739366936950900796739795;
    
    uint256 constant IC27x = 14527565647042473833164468956000362795519314198262866225352631554103417406048;
    uint256 constant IC27y = 19163038429636451765415902370901493252440686868311522712756801834049736087286;
    
    uint256 constant IC28x = 4563064787502578607504522503795653524780441771903390561095040321594991012805;
    uint256 constant IC28y = 17132961897233615551711030277418083026528303676258815957139396120116493761491;
    
    uint256 constant IC29x = 10825384216191058605866379876945565560465943245071973007006264312285398033060;
    uint256 constant IC29y = 21577743268709413526652653885555866375927505893806393223914213433533358336358;
    
    uint256 constant IC30x = 6397191691971602863357148514208654665119261190406272901198661597143240375;
    uint256 constant IC30y = 19034368636483100848266322777417046441872774162624857636955426992047727086319;
    
    uint256 constant IC31x = 13887187887323344570981409187274970320617448786085046258948210932080686653886;
    uint256 constant IC31y = 18715879836330833238341482186679228139561235361790447129420164142460558259244;
    
    uint256 constant IC32x = 11249333327764660601508194401900817731177098928541819675032435010243826533510;
    uint256 constant IC32y = 18594519484247875970157793842670472272992161543336964034550143549078316481776;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[32] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                
                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))
                
                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))
                
                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))
                
                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))
                
                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))
                
                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))
                

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
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            
            checkField(calldataload(add(_pubSignals, 864)))
            
            checkField(calldataload(add(_pubSignals, 896)))
            
            checkField(calldataload(add(_pubSignals, 928)))
            
            checkField(calldataload(add(_pubSignals, 960)))
            
            checkField(calldataload(add(_pubSignals, 992)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
