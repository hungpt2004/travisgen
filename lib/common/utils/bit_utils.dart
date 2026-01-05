import 'dart:typed_data';

class BitUtils {
  static String orBits(List<String> bits, {int length = 48}) {
    var acc = BigInt.zero;
    final mask = (BigInt.one << length) - BigInt.one;

    for (final s in bits) {
      acc |= BigInt.parse(s, radix: 2);
      // Early exit if already all 1s
      if (acc == mask) break;
    }

    return acc.toRadixString(2).padLeft(length, '0');
  }

  static Uint8List bitsToBytes(String binaryString) {
    final bytes = <int>[];

    for (var i = 0; i < binaryString.length; i += 8) {
      bytes.add(int.parse(binaryString.substring(i, i + 8), radix: 2));
    }

    return Uint8List.fromList(bytes);
  }
}
