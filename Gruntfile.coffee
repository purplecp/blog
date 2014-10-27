module.exports = (grunt) ->
    grunt.initConfig(
        pkg: grunt.file.readJSON('package.json'),
    coffee:
glob_to_multiple:
    expand: true
flatten: false
cwd: 'src'
src: ['**/*.coffee']
dest: 'lib'
ext: '.js'
copy:
    copy_js:
        files:[
            cwd:'src',src:['**/*.js',"**/*.json"],dest:'lib',expand:true,flatten:false,filter:'isFile'
]
exec:
    run:
        cmd: 'node index.js'

watch:
    compile:
        files: 'src/**/*.coffee'
tasks: ['coffee','copy']
options:
    livereload: true

)

grunt.loadNpmTasks('grunt-contrib-coffee')
grunt.loadNpmTasks('grunt-contrib-copy')
grunt.loadNpmTasks('grunt-contrib-watch')
grunt.loadNpmTasks('grunt-exec')
grunt.registerTask('run-app',['coffee','copy:copy_js','exec:run'])
grunt.registerTask('default',["coffee","copy"])
