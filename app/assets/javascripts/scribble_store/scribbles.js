// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

initScribbleCropper = function(aspectRatio) {
  var updateCropper = function(coords) {
    $('#scribble_crop_x').val(coords.x);
    $('#scribble_crop_y').val(coords.y);
    $('#scribble_crop_w').val(coords.w);
    $('#scribble_crop_h').val(coords.h);
  };

  var width = parseInt($('#cropbox').width());
  var height = parseInt($('#cropbox').height());

  $('#cropbox').Jcrop({
    aspectRatio: aspectRatio,
    setSelect: [0, 0, width, height],
    onSelect: updateCropper,
    onChange: updateCropper
  });
};