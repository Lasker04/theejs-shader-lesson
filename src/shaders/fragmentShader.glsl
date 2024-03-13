uniform vec3 uColor; // rgbのため3次元ベクトル

void main() {
  // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); // 四次元ベクトルを指定する。rgbaで指定
  gl_FragColor =  vec4(uColor, 1.0);
}

