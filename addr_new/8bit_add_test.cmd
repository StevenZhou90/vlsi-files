# Initialize power
h Vdd!
l GND!
s
echo "=== 8-bit Add/Subtract Unit Test ==="

# Test 1: 0 + 0 = 0 (cin=0 for addition)
echo "Test 1: 0 + 0 = 0 (addition)"
l a0 a1 a2 a3 a4 a5 a6 a7
l b0 b1 b2 b3 b4 b5 b6 b7
l cin
s
assert s0 l
assert s1 l
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout l

# Test 2: 1 + 1 = 2 (cin=0 for addition)
echo "Test 2: 1 + 1 = 2"
h a0
l a1 a2 a3 a4 a5 a6 a7
h b0
l b1 b2 b3 b4 b5 b6 b7
l cin
s
assert s0 l
assert s1 h
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout l

# Test 3: 255 + 1 = 0 with cout=1 (cin=0)
echo "Test 3: 255 + 1 = 256 (overflow)"
h a0 a1 a2 a3 a4 a5 a6 a7
h b0
l b1 b2 b3 b4 b5 b6 b7
l cin
s
assert s0 l
assert s1 l
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout h

# Test 4: 15 + 15 = 30 (cin=0)
echo "Test 4: 15 + 15 = 30"
h a0 a1 a2 a3
l a4 a5 a6 a7
h b0 b1 b2 b3
l b4 b5 b6 b7
l cin
s
assert s0 l
assert s1 h
assert s2 h
assert s3 h
assert s4 h
assert s5 l
assert s6 l
assert s7 l
assert cout l

# Test 5: 5 - 3 = 2 (cin=1 for subtraction)
echo "Test 5: 5 - 3 = 2 (subtraction)"
h a0
l a1
h a2
l a3 a4 a5 a6 a7
h b0 b1
l b2 b3 b4 b5 b6 b7
h cin
s
assert s0 l
assert s1 h
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout h

# Test 6: 0 - 1 = 255 (cin=1, underflow)
echo "Test 6: 0 - 1 = 255 (underflow)"
l a0 a1 a2 a3 a4 a5 a6 a7
h b0
l b1 b2 b3 b4 b5 b6 b7
h cin
s
assert s0 h
assert s1 h
assert s2 h
assert s3 h
assert s4 h
assert s5 h
assert s6 h
assert s7 h
assert cout l

# Test 7: 10 - 10 = 0 (cin=1)
echo "Test 7: 10 - 10 = 0"
l a0
h a1
l a2
h a3
l a4 a5 a6 a7
l b0
h b1
l b2
h b3
l b4 b5 b6 b7
h cin
s
assert s0 l
assert s1 l
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout h

# Test 8: 128 + 128 = 256 (overflow test)
echo "Test 8: 128 + 128 = 256 (overflow)"
l a0 a1 a2 a3 a4 a5 a6
h a7
l b0 b1 b2 b3 b4 b5 b6
h b7
l cin
s
assert s0 l
assert s1 l
assert s2 l
assert s3 l
assert s4 l
assert s5 l
assert s6 l
assert s7 l
assert cout h

echo "=== All 8-bit Add/Subtract Tests Complete ==="
# Display waveforms for key signals
ana a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7 cin s0 s1 s2 s3 s4 s5 s6 s7 cout

