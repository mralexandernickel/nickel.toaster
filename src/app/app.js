import '../lib/angular/angular';
import '../lib/angular-aria/angular-aria';
import '../lib/angular-animate/angular-animate';
import '../lib/angular-material/angular-material';
import '../lib/nickel.toaster/dist/nickel.toaster';

import ApplicationController from 'controllers/ApplicationController';

angular
  .module('demo', ['nickel.toaster','ngMaterial'])
  .controller('ApplicationController', ApplicationController)

angular.bootstrap(document, ['demo'])
