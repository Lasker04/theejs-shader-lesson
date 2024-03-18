uniform vec3 uColor; // rgbのため3次元ベクトル
uniform sampler2D uTexture;

varying vec2 vUv; // vertexShaderから取得する
varying float vEvelation;

void main() {
  // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); // 四次元ベクトルを指定する。rgbaで指定
  // gl_FragColor =  vec4(uColor, 1.0);
  vec4 textureColor = texture2D(uTexture, vUv); // uv：　ラッピングするための座標を取得する必要がある
  textureColor.rgb *= vEvelation * 2.5 + 0.7;
  gl_FragColor =  textureColor;
}

