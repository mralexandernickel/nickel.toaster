class Toaster {
  constructor() {
    this.config = {
      position: 'bottom left',
      duration: 5000,
      priorities: ['default','info','success','warn','danger']
    };
    this.createContainer();
  }

  createContainer() {
    this.container = document.createElement('div');
    this.container.className += `toaster ${this.config.position}`;
    document.body.appendChild(this.container);
  }

  create(priority, text) {
    let toast = document.createElement('div');
    toast.classList.add('toast', priority, 'out');
    toast.textContent = text;
    return toast;
  }

  show(priority, text, duration = this.config.duration) {
    let toast = this.create(priority, text);
    this.container.appendChild(toast);
    window.setTimeout(() => {
      toast.classList.remove('out');
      window.setTimeout(() => {
        toast.addEventListener('transitionend', () => {
          this.container.removeChild(toast);
        });
        toast.classList.add('out');
      }, duration)
    },0);
  }
}

angular
  .module('nickel.toaster', [])
  .service('nickelToast', Toaster)
