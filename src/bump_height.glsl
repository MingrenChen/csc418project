// Create a bumpy surface by using procedural noise to generate a height (
// displacement in normal direction).
float bump_height(bool is_mercury, bool is_venus, bool is_earth, bool is_mars, vec3 s)
{
  /////////////////////////////////////////////////////////////////////////////
  // Really cool! Mainly from http://developer.download.nvidia.com/books/HTML/gpugems/gpugems_ch05.html
  float sum = 0.5;
  float size = 2;
  float scale = size;

  while (scale >= 0.128) {
    sum *= improved_perlin_noise(s / scale);
    scale /= 2.0;
    
  }
  float noise = 0.5 + 0.5 * sin(4 * M_PI * (s.x + 2.5 * sum/sin(sum)));
  noise = (noise * noise - 0.5)*noise * 0.01/ 7;

  float h = noise * 30.2;

  if (is_mercury) {
    noise = 0.85 * improved_perlin_noise(s * 8.5) + 0.10 * improved_perlin_noise(s * 2) + 0.05 * improved_perlin_noise(s * 2.68);
    return smooth_heaviside(noise * 3.5, 3) * 0.567;
  } else if (is_venus) {
    noise = 0.5 + 2 * sin(4 * M_PI * (s.x + 1 * sum));
    h = noise * 3.2;
  } else if (is_earth) {
    noise = 0.5 + 0.5 * sin(2 * M_PI * (s.x + 1 * sum));
    h = noise * 30.2;
  }else if (is_mars) {
    noise = 0.5 + sin(2 * M_PI * (s.x + 1 * sum));
    h = noise * 0.2;
  }
  
  return smooth_heaviside(h, 1.3) * 0.2;
  /////////////////////////////////////////////////////////////////////////////
}
