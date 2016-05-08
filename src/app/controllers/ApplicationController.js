export default class {
  constructor(nickelToast) {
    this.nickelToast = nickelToast;
  }

  showToast(priority, $index) {
    this.nickelToast.show(priority, 'Some example Toast', 5000+(2000*$index));
  }
}
