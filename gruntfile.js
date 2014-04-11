module.exports = function(grunt){

  grunt.loadNpmTasks('grunt-markdown-pdf');
  grunt.loadNpmTasks('grunt-git-rev-parse');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');

  grunt.initConfig(
  {
    pkg: grunt.file.readJSON('package.json'),
    "git-rev-parse": {
      build: {
        options: {
          prop: 'git-revision',
          number: 6
        }
      }
    }, // git-rev-parse

    copy:
    {
      files: {
        expand: true,
        src: ['openreferral.md'],
        dest: "tmp",
        filter: 'isFile',
        rename: function(dest, src) {
          var returnVal = dest+'/'+src.substring(0, src.indexOf('.md')) +
          '-<%= grunt.config.get(\'git-revision\') %>.md';
          return returnVal;
        } // rename
      } // files
    }, // copy

    markdownpdf:
    {
      files:
      {
        src: "tmp/openreferral-<%= grunt.config.get('git-revision') %>.md",
        dest: "pdf"
      }
    }, // markdownpdf

    clean: ["tmp"], // clean

  });

  grunt.registerTask('pdf', ['git-rev-parse','copy','markdownpdf','clean']);
} //exports