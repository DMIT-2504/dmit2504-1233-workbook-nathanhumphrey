/// Returns the surface area of rectangle with [width], [length], and [height]
///
/// Throws an [Exception] any of [width], [length], or [height] are zero or
/// negative
int surfaceArea(int width, int length, int height) {
  if (width <= 0 || length <= 0 || height <= 0) {
    throw Exception('Width, length, and height must be positive');
  }

  return (2 * width * height) + (2 * width * length) + (2 * width * length);
}

// TODO: create the volume function
