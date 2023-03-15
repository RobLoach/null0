class Null0GameComponent extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({mode: 'open'});
    this.shadow.innerHTML = `
      <style>
      canvas {
        background-color: red;
      }
      </style>
      <canvas width=320 height=240></canvas>
    `;
  }
  
  connectedCallback() {
    console.log('CONNECTED')
    const cartName = this.getAttribute('cart')
    
    if (!cartName) {
      return
    }
    
    this.canvas = this.shadow.querySelector('canvas')
    this.context = this.canvas.getContext('2d')
    
    const animate = () => {
      requestAnimationFrame(animate);
      console.log('ANIMATE')
    }
    animate()
  }
}

customElements.define('null0-game', Null0GameComponent)
