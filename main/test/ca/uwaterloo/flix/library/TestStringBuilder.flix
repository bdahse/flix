/*
 * Copyright 2019 Stephen Tetley
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


/////////////////////////////////////////////////////////////////////////////
// new                                                                     //
/////////////////////////////////////////////////////////////////////////////
@test
def new01(): StringBuilder & Impure = StringBuilder.new()

/////////////////////////////////////////////////////////////////////////////
// append                                                                  //
/////////////////////////////////////////////////////////////////////////////
@test 
def append01(): Bool & Impure =
    let sb1 = StringBuilder.new();
    let sb2 = StringBuilder.new();
    StringBuilder.append(sb1, sb2);
    StringBuilder.toString(sb1) == ""

@test 
def append02(): Bool & Impure =
    let sb1 = StringBuilder.new();
    let sb2 = StringBuilder.new();
    StringBuilder.appendString(sb1, "Hello");
    StringBuilder.append(sb1, sb2);
    StringBuilder.toString(sb1) == "Hello"

@test 
def append03(): Bool & Impure =
    let sb1 = StringBuilder.new();
    let sb2 = StringBuilder.new();
    StringBuilder.appendString(sb2, "World!");
    StringBuilder.append(sb1, sb2);
    StringBuilder.toString(sb1) == "World!"

@test 
def append04(): Bool & Impure =
    let sb1 = StringBuilder.new();
    let sb2 = StringBuilder.new();
    StringBuilder.appendString(sb1, "Hello");
    StringBuilder.appendString(sb2, " World!");
    StringBuilder.append(sb1, sb2);
    StringBuilder.toString(sb1) == "Hello World!"

/////////////////////////////////////////////////////////////////////////////
// appendString                                                            //
/////////////////////////////////////////////////////////////////////////////
@test
def appendString01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendString(sb, "hello");
    StringBuilder.toString(sb) == "hello"

@test
def appendString02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendString(sb, "hello");
    StringBuilder.appendString(sb, "!");
    StringBuilder.toString(sb) == "hello!"

@test
def appendString03(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendString(sb, "hello");
    StringBuilder.appendString(sb, " ");
    StringBuilder.appendString(sb, "world!");
    StringBuilder.toString(sb) == "hello world!"

/////////////////////////////////////////////////////////////////////////////
// appendChar                                                              //
/////////////////////////////////////////////////////////////////////////////
@test
def appendChar01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.toString(sb) == "A"

@test
def appendChar02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.appendChar(sb, 'B');
    StringBuilder.toString(sb) == "AB"

@test
def appendChar03(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.appendChar(sb, 'B');
    StringBuilder.appendChar(sb, 'C');
    StringBuilder.toString(sb) == "ABC"

/////////////////////////////////////////////////////////////////////////////
// appendInt8                                                              //
/////////////////////////////////////////////////////////////////////////////
@test
def appendInt801(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt8(sb, 0i8);
    StringBuilder.toString(sb) == "0"

@test
def appendInt802(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt8(sb, 1i8);
    StringBuilder.toString(sb) == "1"

@test
def appendInt803(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt8(sb, -1i8);
    StringBuilder.toString(sb) == "-1"

@test
def appendInt804(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt8(sb, 127i8);
    StringBuilder.toString(sb) == "127"

@test
def appendInt805(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt8(sb, -127i8);
    StringBuilder.toString(sb) == "-127"

/////////////////////////////////////////////////////////////////////////////
// appendInt16                                                             //
/////////////////////////////////////////////////////////////////////////////
@test
def appendInt1601(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt16(sb, 0i16);
    StringBuilder.toString(sb) == "0"

@test
def appendInt1602(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt16(sb, 1i16);
    StringBuilder.toString(sb) == "1"

@test
def appendInt1603(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt16(sb, -1i16);
    StringBuilder.toString(sb) == "-1"

/////////////////////////////////////////////////////////////////////////////
// appendInt32                                                             //
/////////////////////////////////////////////////////////////////////////////
@test
def appendInt3201(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt32(sb, 0);
    StringBuilder.toString(sb) == "0"

@test
def appendInt3202(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt32(sb, 1);
    StringBuilder.toString(sb) == "1"

@test
def appendInt3203(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt32(sb, -1);
    StringBuilder.toString(sb) == "-1"

/////////////////////////////////////////////////////////////////////////////
// appendInt64                                                             //
/////////////////////////////////////////////////////////////////////////////
@test
def appendInt6401(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt64(sb, 0i64);
    StringBuilder.toString(sb) == "0"

@test
def appendInt6402(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt64(sb, 1i64);
    StringBuilder.toString(sb) == "1"

@test
def appendInt6403(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendInt64(sb, -1i64);
    StringBuilder.toString(sb) == "-1"

/////////////////////////////////////////////////////////////////////////////
// appendBigInt                                                            //
/////////////////////////////////////////////////////////////////////////////
@test
def appendBigInt01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendBigInt(sb, 0ii);
    StringBuilder.toString(sb) == "0"

@test
def appendBigInt02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendBigInt(sb, 1ii);
    StringBuilder.toString(sb) == "1"

@test
def appendBigInt03(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendBigInt(sb, -1ii);
    StringBuilder.toString(sb) == "-1"

/////////////////////////////////////////////////////////////////////////////
// appendFloat32                                                           //
/////////////////////////////////////////////////////////////////////////////
@test
def appendFloat3201(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat32(sb, 0.0f32);
    StringBuilder.toString(sb) == "0.0"

@test
def appendFloat3202(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat32(sb, Float32.nan());
    StringBuilder.toString(sb) == "NaN"

@test
def appendFloat3203(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat32(sb, Float32.positiveInfinity());
    StringBuilder.toString(sb) == "Infinity"

@test
def appendFloat3204(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat32(sb, Float32.negativeInfinity());
    StringBuilder.toString(sb) == "-Infinity"

/////////////////////////////////////////////////////////////////////////////
// appendFloat64                                                           //
/////////////////////////////////////////////////////////////////////////////
@test
def appendFloat6401(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat64(sb, 0.0f64);
    StringBuilder.toString(sb) == "0.0"

@test
def appendFloat6402(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat64(sb, Float64.nan());
    StringBuilder.toString(sb) == "NaN"

@test
def appendFloat6403(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat64(sb, Float64.positiveInfinity());
    StringBuilder.toString(sb) == "Infinity"

@test
def appendFloat6404(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendFloat64(sb, Float64.negativeInfinity());
    StringBuilder.toString(sb) == "-Infinity"

/////////////////////////////////////////////////////////////////////////////
// appendLineSeparator                                                     //
/////////////////////////////////////////////////////////////////////////////
@test
def appendLineSeparator01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendLineSeparator(sb);
    StringBuilder.toString(sb) == String.lineSeparator()

@test
def appendLineSeparator02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.appendLineSeparator(sb);
    StringBuilder.appendChar(sb, 'B');
    let s1 = "A" + String.lineSeparator() + "B";
    StringBuilder.toString(sb) == s1

/////////////////////////////////////////////////////////////////////////////
// appendLine                                                              //
/////////////////////////////////////////////////////////////////////////////
@test
def appendLine01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendLine(sb, "");
    StringBuilder.toString(sb) == String.lineSeparator()

@test
def appendLine02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendLine(sb, "A");
    StringBuilder.appendChar(sb, 'B');
    let s1 = "A" + String.lineSeparator() + "B";
    StringBuilder.toString(sb) == s1

@test
def appendLine03(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendLine(sb, "A");
    StringBuilder.appendLine(sb, "B");
    let s1 = "A" + String.lineSeparator() + "B" + String.lineSeparator();
    StringBuilder.toString(sb) == s1

/////////////////////////////////////////////////////////////////////////////
// length                                                                  //
/////////////////////////////////////////////////////////////////////////////
@test
def length01(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.length(sb) == 0

@test
def length02(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.length(sb) == 1

@test
def length03(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendChar(sb, 'A');
    StringBuilder.appendChar(sb, 'B');
    StringBuilder.length(sb) == 2

@test
def length04(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendString(sb, "A");
    StringBuilder.appendString(sb, "B");
    StringBuilder.length(sb) == 2

@test
def length05(): Bool & Impure =
    let sb = StringBuilder.new();
    StringBuilder.appendString(sb, "Hello");
    StringBuilder.appendChar(sb, ' ');
    StringBuilder.appendString(sb, "World");
    StringBuilder.appendChar(sb, '!');
    StringBuilder.length(sb) == 12
