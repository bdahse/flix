/*
 * Copyright 2017 Liam Palmer
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace TestInt64 {

    /////////////////////////////////////////////////////////////////////////////
    // maxValue                                                                //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def maxValue01(): Bool = Int64.maxValue() == ~~~(1i64 <<< 63)

    /////////////////////////////////////////////////////////////////////////////
    // minValue                                                                //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def minValue01(): Bool = Int64.minValue() == (1i64 <<< 63)

    /////////////////////////////////////////////////////////////////////////////
    // size                                                                    //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def size01(): Bool = Int64.size() == 64

    /////////////////////////////////////////////////////////////////////////////
    // min                                                                     //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def min01(): Bool = Int64.min(1i64, 2i64) == 1i64

    @test
    def min02(): Bool = Int64.min(2i64, -1i64) == -1i64

    @test
    def min03(): Bool = Int64.min(-33i64, -66i64) == -66i64

    /////////////////////////////////////////////////////////////////////////////
    // max                                                                     //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def max01(): Bool = Int64.max(48i64, 49i64) == 49i64

    @test
    def max02(): Bool = Int64.max(4i64, -16i64) == 4i64

    @test
    def max03(): Bool = Int64.max(-34i64, -16i64) == -16i64

    /////////////////////////////////////////////////////////////////////////////
    // abs                                                                     //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def abs01(): Bool = Int64.abs(63i64) == 63i64

    @test
    def abs02(): Bool = Int64.abs(-63i64) == 63i64

    @test
    def abs03(): Bool = Int64.abs(9223372036854775807i64) == 9223372036854775807i64

    @test
    def abs04(): Bool = Int64.abs(-9223372036854775807i64) == 9223372036854775807i64

    @test
    def abs05(): Bool = Int64.abs(0i64) == 0i64

    @test
    def abs06(): Bool = Int64.abs(-9223372036854775808i64) == -1i64

    /////////////////////////////////////////////////////////////////////////////
    // dist                                                                    //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def dist01(): Bool = Int64.dist(31i64, -7i64) == 38i64

    @test
    def dist02(): Bool = Int64.dist(-44i64, -1i64) == 43i64

    @test
    def dist03(): Bool = Int64.dist(-2i64, -2i64) == 0i64

    @test
    def dist04(): Bool = Int64.dist(-9223372036854775808i64, -1i64) == 9223372036854775807i64

    @test
    def dist05(): Bool = Int64.dist(-9223372036854775808i64, 0i64) == -1i64

    @test
    def dist06(): Bool = Int64.dist(-123i64, 4i64) == 127i64

    @test
    def dist07(): Bool = Int64.dist(-9223372036854775803i64, 5i64) == -1i64

    /////////////////////////////////////////////////////////////////////////////
    // compare                                                                 //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def compare01(): Bool = Int64.compare(-1i64, 44i64) == -1

    @test
    def compare02(): Bool = Int64.compare(-1i64, -44i64) == 1

    @test
    def compare03(): Bool = Int64.compare(88i64, 88i64) == 0

    /////////////////////////////////////////////////////////////////////////////
    // signum                                                                  //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def signum01(): Bool = Int64.signum(-22i64) == -1

    @test
    def signum02(): Bool = Int64.signum(22i64) == 1

    @test
    def signum03(): Bool = Int64.signum(0i64) == 0

    /////////////////////////////////////////////////////////////////////////////
    // logicalRightShift                                                       //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def logicalRightShift01(): Bool = Int64.logicalRightShift(2233i64, 4) == (2233i64 >>> 4)

    @test
    def logicalRightShift02(): Bool = Int64.logicalRightShift(22336688888i64, 33) == (22336688888i64 >>> 33)

    @test
    def logicalRightShift03(): Bool = Int64.logicalRightShift(2233i64, -8) == (2233i64 >>> -8)

    @test
    def logicalRightShift04(): Bool = Int64.logicalRightShift(2233i64, 4) == (2233i64 >>> 4)

    @test
    def logicalRightShift05(): Bool = Int64.logicalRightShift(-1i64, 1) == 9223372036854775807i64

    @test
    def logicalRightShift06(): Bool = Int64.logicalRightShift(-35i64, 4) == 1152921504606846973i64

    @test
    def logicalRightShift07(): Bool = Int64.logicalRightShift(-2777i64, -2777) == 33554431i64

    @test
    def logicalRightShift08(): Bool = Int64.logicalRightShift(-23328384858i64, 64) == -23328384858i64

    @test
    def logicalRightShift09(): Bool = Int64.logicalRightShift(-27000000000000i64, 0) == -27000000000000i64

    @test
    def logicalRightShift10(): Bool = Int64.logicalRightShift(9223372036854775807i64, 1) == 4611686018427387903i64

    @test
    def logicalRightShift11(): Bool = Int64.logicalRightShift(-9223372036854775808i64, 1) == 4611686018427387904i64

    /////////////////////////////////////////////////////////////////////////////
    // bitCount                                                                //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def bitCount01(): Bool = Int64.bitCount(1990911889900134i64) == 25

    @test
    def bitCount02(): Bool = Int64.bitCount(-1i64) == 64

    @test
    def bitCount03(): Bool = Int64.bitCount(-999888888114322199i64) == 35

    @test
    def bitCount04(): Bool = Int64.bitCount(0i64) == 0

    @test
    def bitCount05(): Bool = Int64.bitCount(-9223372036854775808i64) == 1

    @test
    def bitCount06(): Bool = Int64.bitCount(-9223372036854775805i64) == 3

    @test
    def bitCount07(): Bool = Int64.bitCount(9223372036854775807i64) == 63

    @test
    def bitCount08(): Bool = Int64.bitCount(9223372036854775806i64) == 62

    @test
    def bitCount09(): Bool = Int64.bitCount(9223372036854775791i64) == 62

    /////////////////////////////////////////////////////////////////////////////
    // rotateLeft                                                              //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def rotateLeft01(): Bool = Int64.rotateLeft(-99991001265258663i64, 7) == 5647895911756442879i64

    @test
    def rotateLeft02(): Bool = Int64.rotateLeft(-983667729064i64, 24) == 1943538110990123007i64

    @test
    def rotateLeft03(): Bool = Int64.rotateLeft(-983667729064i64, -104) == 1943538110990123007i64

    @test
    def rotateLeft04(): Bool = Int64.rotateLeft(1478293001i64, 23) == 12400820494532608i64

    @test
    def rotateLeft05(): Bool = Int64.rotateLeft(1478293001i64, -41) == 12400820494532608i64

    @test
    def rotateLeft06(): Bool = Int64.rotateLeft(1478293001i64, 87) == 12400820494532608i64

    @test
    def rotateLeft07(): Bool = Int64.rotateLeft(0i64, 87) == 0i64

    @test
    def rotateLeft08(): Bool = Int64.rotateLeft(-1i64, 87) == -1i64

    @test
    def rotateLeft09(): Bool = Int64.rotateLeft(-9223372036854775808i64, 3) == 4i64

    @test
    def rotateLeft10(): Bool = Int64.rotateLeft(9223372036854775807i64, 2) == -3i64

    /////////////////////////////////////////////////////////////////////////////
    // rotateRight                                                             //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def rotateRight01(): Bool = Int64.rotateRight(-99991001265258663i64, 57) == 5647895911756442879i64

    @test
    def rotateRight02(): Bool = Int64.rotateRight(-983667729064i64, 40) == 1943538110990123007i64

    @test
    def rotateRight03(): Bool = Int64.rotateRight(-983667729064i64, -88) == 1943538110990123007i64

    @test
    def rotateRight04(): Bool = Int64.rotateRight(1478293001i64, 41) == 12400820494532608i64

    @test
    def rotateRight05(): Bool = Int64.rotateRight(1478293001i64, -23) == 12400820494532608i64

    @test
    def rotateRight06(): Bool = Int64.rotateRight(1478293001i64, 105) == 12400820494532608i64

    @test
    def rotateRight07(): Bool = Int64.rotateRight(0i64, 87) == 0i64

    @test
    def rotateRight08(): Bool = Int64.rotateRight(-1i64, 87) == -1i64

    @test
    def rotateRight09(): Bool = Int64.rotateRight(-9223372036854775808i64, 3) == 1152921504606846976i64

    @test
    def rotateRight10(): Bool = Int64.rotateRight(9223372036854775807i64, 2) == -2305843009213693953i64

    /////////////////////////////////////////////////////////////////////////////
    // reverse                                                                 //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def reverse01(): Bool = Int64.reverse(5093163785157044906i64) == 6149336169419208034i64

    @test
    def reverse02(): Bool = Int64.reverse(6149336169419208034i64) == 5093163785157044906i64

    @test
    def reverse03(): Bool = Int64.reverse(8455181377513485674i64) == 6245943384048626350i64

    @test
    def reverse04(): Bool = Int64.reverse(6245943384048626350i64) == 8455181377513485674i64

    @test
    def reverse05(): Bool = Int64.reverse(-9223372036854775808i64) == 1i64

    @test
    def reverse06(): Bool = Int64.reverse(1i64) == -9223372036854775808i64

    @test
    def reverse07(): Bool = Int64.reverse(4i64) == 2305843009213693952i64

    @test
    def reverse08(): Bool = Int64.reverse(2305843009213693952i64) == 4i64

    @test
    def reverse09(): Bool = Int64.reverse(-1i64) == -1i64

    @test
    def reverse10(): Bool = Int64.reverse(0i64) == 0i64

    /////////////////////////////////////////////////////////////////////////////
    // highestOneBitPosition                                                   //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def highestOneBitPosition01(): Bool = Int64.highestOneBitPosition(-1i64) == 63

    @test
    def highestOneBitPosition02(): Bool = Int64.highestOneBitPosition(-9223372036854775808i64) == 63

    @test
    def highestOneBitPosition03(): Bool = Int64.highestOneBitPosition(1i64) == 0

    @test
    def highestOneBitPosition04(): Bool = Int64.highestOneBitPosition(2i64) == 1

    @test
    def highestOneBitPosition05(): Bool = Int64.highestOneBitPosition(3i64) == 1

    @test
    def highestOneBitPosition06(): Bool = Int64.highestOneBitPosition(20i64) == 4

    @test
    def highestOneBitPosition07(): Bool = Int64.highestOneBitPosition(2i64 ** 30i64) == 30

    @test
    def highestOneBitPosition08(): Bool = Int64.highestOneBitPosition(9223372036854775807i64) == 62

    @test
    def highestOneBitPosition09(): Bool = Int64.highestOneBitPosition(0i64) == -1

    @test
    def highestOneBitPosition10(): Bool = Int64.highestOneBitPosition(2i64 ** 23i64 + 2i64 ** 60i64) == 60

    @test
    def highestOneBitPosition11(): Bool = Int64.highestOneBitPosition(2i64 ** 20i64 + 2i64 ** 59i64) == 59

    @test
    def highestOneBitPosition12(): Bool = Int64.highestOneBitPosition(-44556677i64) == 63

    /////////////////////////////////////////////////////////////////////////////
    // highestOneBit                                                           //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def highestOneBit01(): Bool = Int64.highestOneBit(-1i64) == (1i64 <<< 63)

    @test
    def highestOneBit02(): Bool = Int64.highestOneBit(-9223372036854775808i64) == (1i64 <<< 63)

    @test
    def highestOneBit03(): Bool = Int64.highestOneBit(-778899i64) == (1i64 <<< 63)

    @test
    def highestOneBit04(): Bool = Int64.highestOneBit(2i64) == 2i64

    @test
    def highestOneBit05(): Bool = Int64.highestOneBit(3i64) == 2i64

    @test
    def highestOneBit06(): Bool = Int64.highestOneBit(20i64) == 16i64

    @test
    def highestOneBit07(): Bool = Int64.highestOneBit(2i64 ** 57i64 + 2i64 ** 32i64) == 144115188075855872i64

    @test
    def highestOneBit08(): Bool = Int64.highestOneBit(9223372036854775807i64) == 4611686018427387904i64

    @test
    def highestOneBit09(): Bool = Int64.highestOneBit(0i64) == 0i64

    @test
    def highestOneBit10(): Bool = Int64.highestOneBit(2i64 ** 44i64 + 2i64 ** 18i64) == 17592186044416i64

    /////////////////////////////////////////////////////////////////////////////
    // numberOfLeadingZeros                                                    //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def numberOfLeadingZeros01(): Bool = Int64.numberOfLeadingZeros(0i64) == 64

    @test
    def numberOfLeadingZeros02(): Bool = Int64.numberOfLeadingZeros(-9223372036854775808i64) == 0

    @test
    def numberOfLeadingZeros03(): Bool = Int64.numberOfLeadingZeros(-1i64) == 0

    @test
    def numberOfLeadingZeros04(): Bool = Int64.numberOfLeadingZeros(~~~(1i64 <<< 63)) == 1

    @test
    def numberOfLeadingZeros05(): Bool = Int64.numberOfLeadingZeros(2i64 ** 62i64) == 1

    @test
    def numberOfLeadingZeros06(): Bool = Int64.numberOfLeadingZeros(2i64 ** 61i64 + 2i64 ** 18i64) == 2

    @test
    def numberOfLeadingZeros07(): Bool = Int64.numberOfLeadingZeros(2i64 ** 20i64 + 2i64 ** 18i64) == 43

    @test
    def numberOfLeadingZeros08(): Bool = Int64.numberOfLeadingZeros(20i64) == 59

    @test
    def numberOfLeadingZeros09(): Bool = Int64.numberOfLeadingZeros(1i64) == 63

    /////////////////////////////////////////////////////////////////////////////
    // lowestOneBitPosition                                                    //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def lowestOneBitPosition01(): Bool = Int64.lowestOneBitPosition(-1i64) == 0

    @test
    def lowestOneBitPosition02(): Bool = Int64.lowestOneBitPosition(-9223372036854775808i64) == 63

    @test
    def lowestOneBitPosition03(): Bool = Int64.lowestOneBitPosition(1i64) == 0

    @test
    def lowestOneBitPosition04(): Bool = Int64.lowestOneBitPosition(2i64) == 1

    @test
    def lowestOneBitPosition05(): Bool = Int64.lowestOneBitPosition(3i64) == 0

    @test
    def lowestOneBitPosition06(): Bool = Int64.lowestOneBitPosition(4i64) == 2

    @test
    def lowestOneBitPosition07(): Bool = Int64.lowestOneBitPosition(12i64) == 2

    @test
    def lowestOneBitPosition08(): Bool = Int64.lowestOneBitPosition(2i64 ** 30i64) == 30

    @test
    def lowestOneBitPosition09(): Bool = Int64.lowestOneBitPosition(2i64 ** 57i64 + 2i64 ** 18i64) == 18

    @test
    def lowestOneBitPosition10(): Bool = Int64.lowestOneBitPosition(9223372036854775807i64) == 0

    @test
    def lowestOneBitPosition11(): Bool = Int64.lowestOneBitPosition(0i64) == -1

    /////////////////////////////////////////////////////////////////////////////
    // lowestOneBit                                                            //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def lowestOneBit01(): Bool = Int64.lowestOneBit(-1i64) == 1i64

    @test
    def lowestOneBit02(): Bool = Int64.lowestOneBit(-9223372036854775808i64) == (1i64 <<< 63)

    @test
    def lowestOneBit03(): Bool = Int64.lowestOneBit(1i64) == 1i64

    @test
    def lowestOneBit04(): Bool = Int64.lowestOneBit(2i64) == 2i64

    @test
    def lowestOneBit05(): Bool = Int64.lowestOneBit(6i64) == 2i64

    @test
    def lowestOneBit06(): Bool = Int64.lowestOneBit(12i64) == 4i64

    @test
    def lowestOneBit07(): Bool = Int64.lowestOneBit(2i64 ** 6i64 + 2i64 ** 18i64 + 2i64 ** 27i64) == 64i64

    @test
    def lowestOneBit08(): Bool = Int64.lowestOneBit(2i64 ** 54i64) == 18014398509481984i64

    @test
    def lowestOneBit09(): Bool = Int64.lowestOneBit(2i64 ** 62i64 + 2i64 ** 18i64) == 262144i64

    @test
    def lowestOneBit10(): Bool = Int64.lowestOneBit(9223372036854775807i64) == 1i64

    @test
    def lowestOneBit11(): Bool = Int64.lowestOneBit(0i64) == 0i64

    /////////////////////////////////////////////////////////////////////////////
    // numberOfTrailingZeros                                                   //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def numberOfTrailingZeros01(): Bool = Int64.numberOfTrailingZeros(0i64) == 64

    @test
    def numberOfTrailingZeros02(): Bool = Int64.numberOfTrailingZeros(3i64) == 0

    @test
    def numberOfTrailingZeros03(): Bool = Int64.numberOfTrailingZeros(42i64) == 1

    @test
    def numberOfTrailingZeros04(): Bool = Int64.numberOfTrailingZeros(2i64 ** 16i64 + 2i64 ** 22i64) == 16

    @test
    def numberOfTrailingZeros05(): Bool = Int64.numberOfTrailingZeros(2i64 ** 57i64) == 57

    @test
    def numberOfTrailingZeros06(): Bool = Int64.numberOfTrailingZeros(-1i64) == 0

    @test
    def numberOfTrailingZeros07(): Bool = Int64.numberOfTrailingZeros(-9223372036854775808i64) == 63

    /////////////////////////////////////////////////////////////////////////////
    // getBit                                                                  //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def getBit01(): Bool = Int64.getBit(-1i64, 5) == 1

    @test
    def getBit02(): Bool = Int64.getBit(-1000000i64, 63) == 1

    @test
    def getBit03(): Bool = Int64.getBit(2i64 ** 59i64, 59) == 1

    @test
    def getBit04(): Bool = Int64.getBit(2i64 ** 59i64, 60) == 0

    @test
    def getBit05(): Bool = Int64.getBit(2i64 ** 59i64, 58) == 0

    @test
    def getBit06(): Bool = Int64.getBit(-1i64 - 2i64 ** 61i64, 61) == 0

    @test
    def getBit07(): Bool = Int64.getBit(-1i64 - 2i64 ** 61i64, 60) == 1

    @test
    def getBit08(): Bool = Int64.getBit(0i64, 55) == 0

    /////////////////////////////////////////////////////////////////////////////
    // setBit                                                                  //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def setBit01(): Bool = Int64.setBit(0i64, 0) == 1i64

    @test
    def setBit02(): Bool = Int64.setBit(0i64, 1) == 2i64

    @test
    def setBit03(): Bool = Int64.setBit(0i64, 31) == 2147483648i64

    @test
    def setBit04(): Bool = Int64.setBit(0i64, 32) == 4294967296i64

    @test
    def setBit05(): Bool = Int64.setBit(-1418638422666i64, 31) == -1418638422666i64

    @test
    def setBit07(): Bool = Int64.setBit(-17i64, 4) == -1i64

    @test
    def setBit08(): Bool = Int64.setBit(-1025i64, 10) == -1i64

    @test
    def setBit09(): Bool = Int64.setBit(-17i64, 63) == -17i64

    @test
    def setBit10(): Bool = Int64.setBit(-17i64, 30) == -17i64

    @test
    def setBit11(): Bool = Int64.setBit(0i64, 63) == (1i64 <<< 63)

    @test
    def setBit12(): Bool = Int64.setBit(0i64, 64) == 1i64

    /////////////////////////////////////////////////////////////////////////////
    // clearBit                                                                //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def clearBit01(): Bool = Int64.clearBit(1i64, 0) == 0i64

    @test
    def clearBit02(): Bool = Int64.clearBit(1i64, 1) == 1i64

    @test
    def clearBit03(): Bool = Int64.clearBit(2i64, 1) == 0i64

    @test
    def clearBit04(): Bool = Int64.clearBit(2i64, 2) == 2i64

    @test
    def clearBit05(): Bool = Int64.clearBit(0i64, 31) == 0i64

    @test
    def clearBit06(): Bool = Int64.clearBit(0i64, 30) == 0i64

    @test
    def clearBit07(): Bool = Int64.clearBit(1i64 <<< 63, 63) == 0i64

    @test
    def clearBit08(): Bool = Int64.clearBit(442931848i64, 27) == 308714120i64

    @test
    def clearBit09(): Bool = Int64.clearBit(-1i64, 0) == -2i64

    @test
    def clearBit10(): Bool = Int64.clearBit(-1i64, 1) == -3i64

    @test
    def clearBit11(): Bool = Int64.clearBit(-1i64, 5) == -33i64

    @test
    def clearBit12(): Bool = Int64.clearBit(-1i64, 63) == ~~~(1i64 <<< 63)

    @test
    def clearBit13(): Bool = Int64.clearBit(-1i64, 64) == -2i64

    /////////////////////////////////////////////////////////////////////////////
    // flipBit                                                                 //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def flipBit01(): Bool = Int64.flipBit(1i64, 0) == 0i64

    @test
    def flipBit02(): Bool = Int64.flipBit(1i64, 1) == 3i64

    @test
    def flipBit03(): Bool = Int64.flipBit(2i64, 1) == 0i64

    @test
    def flipBit04(): Bool = Int64.flipBit(2i64, 2) == 6i64

    @test
    def flipBit05(): Bool = Int64.flipBit(0i64, 31) == 2147483648i64

    @test
    def flipBit06(): Bool = Int64.flipBit(0i64, 30) == 1073741824i64

    @test
    def flipBit07(): Bool = Int64.flipBit(1i64 <<< 63, 63) == 0i64

    @test
    def flipBit08(): Bool = Int64.flipBit(-1i64, 0) == -2i64

    @test
    def flipBit9(): Bool = Int64.flipBit(-1i64, 1) == -3i64

    @test
    def flipBit10(): Bool = Int64.flipBit(-1i64, 5) == -33i64

    @test
    def flipBit11(): Bool = Int64.flipBit(-1i64, 31) == (-1i64-(1i64 <<< 31))

    @test
    def flipBit12(): Bool = Int64.flipBit(-1i64, 64) == -2i64

    /////////////////////////////////////////////////////////////////////////////
    // toString                                                                //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def toString01(): Bool = Int64.toString(0i64) == "0"

    @test
    def toString02(): Bool = Int64.toString(1i64) == "1"

    @test
    def toString03(): Bool = Int64.toString(-1i64) == "-1"

    @test
    def toString04(): Bool = Int64.toString(9223372036854775807i64) == "9223372036854775807"

    @test
    def toString05(): Bool = Int64.toString(-9223372036854775808i64) == "-9223372036854775808"

    /////////////////////////////////////////////////////////////////////////////
    // fromString                                                              //
    /////////////////////////////////////////////////////////////////////////////
    @test
    def fromString01(): Bool = Int64.fromString("Bad") |> Result.isErr

    @test
    def fromString02(): Bool = Int64.fromString(" 1") == Ok(1i64)

    @test
    def fromString03(): Bool = Int64.fromString("1 ") == Ok(1i64)

    @test
    def fromString04(): Bool = Int64.fromString("0") == Ok(0i64)

    @test
    def fromString05(): Bool = Int64.fromString("1") == Ok(1i64)

    @test
    def fromString06(): Bool = Int64.fromString("-1") == Ok(-1i64)

    @test
    def fromString07(): Bool = Int64.fromString("9223372036854775807") == Ok(9223372036854775807i64)

    @test
    def fromString08(): Bool = Int64.fromString("-9223372036854775808") == Ok(-9223372036854775808i64)

}
