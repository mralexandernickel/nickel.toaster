module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    src_path: "src"
    assets_path: "dist"
    demo_path: "public/assets/lib/<%= pkg.name %>/dist"
    babel:
      dist:
        options:
          plugins: ['transform-es2015-modules-systemjs']
          presets: ['es2015']
        files: [
          expand: true
          cwd: "<%= src_path %>/module"
          src: ["**/*.js"]
          dest: "<%= assets_path %>"
        ]
      dev:
        options:
          plugins: ['transform-es2015-modules-systemjs']
          presets: ['es2015']
        files: [
          expand: true
          cwd: "<%= src_path %>/module"
          src: ["**/*.js"]
          dest: "<%= demo_path %>"
        ]
      demo:
        options:
          plugins: ['transform-es2015-modules-systemjs']
          presets: ['es2015']
        files: [
          expand: true
          cwd: "<%= src_path %>/app"
          src: ["**/*.js"]
          dest: "public/assets/app"
        ]
    sass:
      options:
        sourceMap: true
        includePaths: [
          "<%= src_path %>/sass"
        ]
      dist:
        files:
          "<%= assets_path %>/<%= pkg.name %>.css": "<%= src_path %>/sass/app.sass"
      dev:
        files:
          "<%= demo_path %>/<%= pkg.name %>.css": "<%= src_path %>/sass/app.sass"
    autoprefixer:
      dist:
        src: "<%= assets_path %>/<%= pkg.name %>.css"
        dest: "<%= assets_path %>/<%= pkg.name %>.prefixed.css"
    uglify:
      options:
        mangle: false
      dist:
        files:
          "<%= assets_path %>/<%= pkg.name %>.min.js": ["<%= assets_path %>/<%= pkg.name %>.js"]
    cssmin:
      dist:
        files: [
          expand: true
          cwd: "<%= assets_path %>"
          src: ["*.prefixed.css", "!*.min.css"]
          dest: "<%= assets_path %>"
          ext: ".min.css"
        ]
    watch:
      ecma2015:
        files: ["<%= src_path %>/app/**/*.js"]
        tasks: ["babel:dev"]
      sass:
        files: ["<%= src_path %>/sass/*.sass"]
        tasks: ["sass:dev"]

  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-babel"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["babel:dev","sass:dev"]
