require('./bootstrap');

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();

// ES6 Modules or TypeScript
// import swal from 'sweetalert2';

// CommonJS
// const swal = require('sweetalert2');

import swal from 'sweetalert2';

window.swal = swal;