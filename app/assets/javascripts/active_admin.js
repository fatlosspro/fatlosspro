//= require active_admin/base
//= require tinymce

$(document).ready(function() {
  tinyMCE.init({
    mode : "specific_textareas",
    editor_selector : "tinymce_editor",
    theme: 'advanced',
    plugins: 'youtube',
    theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontsizeselect,|,sub,sup,|,bullist,numlist,|,outdent,indent",
    theme_advanced_buttons2: "cut,copy,paste,pastetext,|,undo,redo,|,link,unlink,image,youtube,code,|,removeformat,visualaid,|,ins_cut",
    theme_advanced_buttons3: "",
    theme_advanced_buttons4: "",
    theme_advanced_toolbar_location: "top",
    theme_advanced_toolbar_align: "left",
    theme_advanced_statusbar_location: "bottom",
    content_css: "css/content.css",
    external_link_list_url: "lists/link_list.js",
    external_image_list_url: "lists/image_list.js",
    object_resizing: false,

    setup: function (ed) {

      ed.addButton('ins_cut', {
        title : 'Cut long text',
        image : '/assets/tinymce/plugins/cut.gif',
        onclick : function() {
          ed.execCommand('mceInsertContent', false, '[cut]')
        }
      });

    }

   });
});
