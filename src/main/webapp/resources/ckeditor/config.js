/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = [

        ['Font', 'FontSize'],

        ['BGColor', 'TextColor' ],

        ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   

        ['BidiLtr', 'BidiRtl'],

        '/',

        ['SpecialChar', 'Smiley'],

        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],

        ['Blockquote', 'NumberedList', 'BulletedList'],

        ['Link', 'Unlink'],

        ['Source'],

        ['Undo', 'Redo']

        ];
	config.filebrowserUploadUrl = "/app/BackgroundUpload";
	
};
