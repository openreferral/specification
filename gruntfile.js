module.exports = function(grunt){

  grunt.loadNpmTasks('grunt-markdown-pdf');
  grunt.loadNpmTasks('grunt-git-rev-parse');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-rename');

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
      files: {expand: true, src: ['openreferral.md'], dest: "tmp", filter: 'isFile'}
    }, // copy

    rename:
    {
      files: {src: ['tmp/openreferral.md'], dest: 'tmp/openreferral-<%= grunt.config.get(\'git-revision\') %>.md'}
    }, // rename

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

  grunt.registerTask('pdf', ['git-rev-parse','copy','rename','markdownpdf','clean']);
} //exports