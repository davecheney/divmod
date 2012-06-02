// Copyright 2012 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package divmod

import "testing"

// arm soft division tests based on benchmark tests presented in 
// http://ridiculousfish.com/blog/posts/labor-of-division-episode-iii.html

const numeratorsSize = 1 << 21

var numerators = randomNumerators()

type randstate struct {
	hi, lo uint32
}

func (r *randstate) rand() uint32 {
	r.hi = r.hi<<16 + r.hi>>16
	r.hi += r.lo
	r.lo += r.hi
	return r.hi
}

func randomNumerators() []uint32 {
	numerators := make([]uint32, numeratorsSize)
	random := &randstate{2147483563, 2147483563 ^ 0x49616E42}
	for i := range numerators {
		numerators[i] = random.rand()
	}
	return numerators
}

func testUint32Div(divisor uint32, t *testing.T) {
	for _, i := range numerators {
		a := i / divisor
		b := div(i, divisor)
		if a != b {
			t.Fatalf("%d / %d: expected %d, actual %d", i, divisor, a, b)
		}
	}
}

func testUint32Mod(divisor uint32, t *testing.T) {
	for _, i := range numerators {
		a := i % divisor
		b := mod(i, divisor)
		if a != b {
			t.Fatalf("%d %% %d: expected %d, actual %d", i, divisor, a, b)
		}
	}
}


func TestUint32Div7(t *testing.T) { testUint32Div(7, t) }
func TestUint32Div37(t *testing.T) { testUint32Div(37, t) }
func TestUint32Div123(t *testing.T) { testUint32Div(123, t) }

func TestUint32Mod7(t *testing.T) { testUint32Mod(7, t) }


func bmUint32Div(divisor uint32, b *testing.B) {
	var sum uint32
	for i := 0; i < b.N; i++ {
		sum += numerators[i&(numeratorsSize-1)] / divisor
	}
}

func BenchmarkUint32Div7(b *testing.B)         { bmUint32Div(7, b) }
func BenchmarkUint32Div37(b *testing.B)        { bmUint32Div(37, b) }
func BenchmarkUint32Div123(b *testing.B)       { bmUint32Div(123, b) }
func BenchmarkUint32Div763(b *testing.B)       { bmUint32Div(763, b) }
func BenchmarkUint32Div1247(b *testing.B)      { bmUint32Div(1247, b) }
func BenchmarkUint32Div9305(b *testing.B)      { bmUint32Div(9305, b) }
func BenchmarkUint32Div13307(b *testing.B)     { bmUint32Div(13307, b) }
func BenchmarkUint32Div52513(b *testing.B)     { bmUint32Div(52513, b) }
func BenchmarkUint32Div60978747(b *testing.B)  { bmUint32Div(60978747, b) }
func BenchmarkUint32Div106956295(b *testing.B) { bmUint32Div(106956295, b) }

func bmUint32Mod(divisor uint32, b *testing.B) {
	var sum uint32
	for i := 0; i < b.N; i++ {
		sum += numerators[i&(numeratorsSize-1)] % divisor
	}
}

func BenchmarkUint32Mod7(b *testing.B)         { bmUint32Mod(7, b) }
func BenchmarkUint32Mod37(b *testing.B)        { bmUint32Mod(37, b) }
func BenchmarkUint32Mod123(b *testing.B)       { bmUint32Mod(123, b) }
func BenchmarkUint32Mod763(b *testing.B)       { bmUint32Mod(763, b) }
func BenchmarkUint32Mod1247(b *testing.B)      { bmUint32Mod(1247, b) }
func BenchmarkUint32Mod9305(b *testing.B)      { bmUint32Mod(9305, b) }
func BenchmarkUint32Mod13307(b *testing.B)     { bmUint32Mod(13307, b) }
func BenchmarkUint32Mod52513(b *testing.B)     { bmUint32Mod(52513, b) }
func BenchmarkUint32Mod60978747(b *testing.B)  { bmUint32Mod(60978747, b) }
func BenchmarkUint32Mod106956295(b *testing.B) { bmUint32Mod(106956295, b) }

func bmUint32FastDiv(divisor uint32, b *testing.B) {
	var sum uint32
	for i := 0; i < b.N; i++ {
		sum += div(numerators[i&(numeratorsSize-1)], divisor)
	}
}

func BenchmarkUint32FastDiv7(b *testing.B)         { bmUint32FastDiv(7, b) }
func BenchmarkUint32FastDiv37(b *testing.B)        { bmUint32FastDiv(37, b) }
func BenchmarkUint32FastDiv123(b *testing.B)       { bmUint32FastDiv(123, b) }
func BenchmarkUint32FastDiv763(b *testing.B)       { bmUint32FastDiv(763, b) }
func BenchmarkUint32FastDiv1247(b *testing.B)      { bmUint32FastDiv(1247, b) }
func BenchmarkUint32FastDiv9305(b *testing.B)      { bmUint32FastDiv(9305, b) }
func BenchmarkUint32FastDiv13307(b *testing.B)     { bmUint32FastDiv(13307, b) }
func BenchmarkUint32FastDiv52513(b *testing.B)     { bmUint32FastDiv(52513, b) }
func BenchmarkUint32FastDiv60978747(b *testing.B)  { bmUint32FastDiv(60978747, b) }
func BenchmarkUint32FastDiv106956295(b *testing.B) { bmUint32FastDiv(106956295, b) }

func bmUint32FastMod(divisor uint32, b *testing.B) {
	var sum uint32
	for i := 0; i < b.N; i++ {
		sum += mod(numerators[i&(numeratorsSize-1)], divisor)
	}
}

func BenchmarkUint32FastMod7(b *testing.B)         { bmUint32FastMod(7, b) }
func BenchmarkUint32FastMod37(b *testing.B)        { bmUint32FastMod(37, b) }
func BenchmarkUint32FastMod123(b *testing.B)       { bmUint32FastMod(123, b) }
func BenchmarkUint32FastMod763(b *testing.B)       { bmUint32FastMod(763, b) }
func BenchmarkUint32FastMod1247(b *testing.B)      { bmUint32FastMod(1247, b) }
func BenchmarkUint32FastMod9305(b *testing.B)      { bmUint32FastMod(9305, b) }
func BenchmarkUint32FastMod13307(b *testing.B)     { bmUint32FastMod(13307, b) }
func BenchmarkUint32FastMod52513(b *testing.B)     { bmUint32FastMod(52513, b) }
func BenchmarkUint32FastMod60978747(b *testing.B)  { bmUint32FastMod(60978747, b) }
func BenchmarkUint32FastMod106956295(b *testing.B) { bmUint32FastMod(106956295, b) }
