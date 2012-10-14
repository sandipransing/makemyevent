jQuery ($) ->
  # bluimp file uploader setup https://github.com/blueimp/jQuery-File-Upload/
  asset_type = ->
    $('#asset_type').val()
  # initialize file uploader
  $("#fileupload").fileupload(
    dataType: "json"
    dropZone: $('#dropzone')
    sequentialUploads: true
  )

  $("#fileupload").bind 'fileuploadstart', (e, data) ->
    if navigator.appName == 'Microsoft Internet Explorer'
      $('#ieProgress').show();
    else
      $('#progressbar').show()
  
  window.added_files_count = 0
  
  # file uploader callbacks
  $("#fileupload").bind "fileuploadadd", (e, data) ->
    window.added_files_count += 1
    fl  = $("#files_list")
    file = data.files[0]
    user_side_identifier = file.name + added_files_count
    if fl.text() == ""
      $("#files_list").append($('<span/>', {id: user_side_identifier}).text(file.name))
    else
      $("#files_list").append($('<span/>', {id: user_side_identifier}).text(', ' + file.name))
    
    data.formData = asset_type: asset_type(), c_form_id: $('.form-stacked').attr('id'), container_identifier: $('.unique_identifier_for_assets').first().val(), container: $('#asset_container').val(), user_side_identifier: user_side_identifier
   
  $("#fileupload").bind "fileuploadprogressall", (e, data) ->
    progress = parseInt(data.loaded / data.total * 100, 10)
    # $('#progressbar').text 'Uploading: ' + progress + '%'
    $('#progressbar .bar').css("width", progress + '%')
    if progress >= 99
      # $('#progressbar').text 'Selected file(s) uploaded'
      $('#progressbar').delay(800).fadeOut()
      $('#ieProgress').removeClass('ie-progress')
  
  $("#fileupload").bind "fileuploaddone", (e, data) ->
    # check whether there is a an asset or not
    tmp = $('.primary-' + data.result.type + '-checkbox').length
    if !tmp
      no_asset = true
    # format file thumbnail
    li = $('<li/>').addClass('span-li').attr('id', 'asset_' + data.result._id)
    tmbnl = $('<div/>').addClass('thumbnail')
    img = $('<img/>').attr('data', 'asset_' + data.result._id).attr('src', data.result.url)
    actions = $('<div/>').addClass 'thumbnail-75'
    
    rm_link = $('<a/>')
    rm_link.attr('href', '/assets/' + data.result._id + '?user_side_identifier=' + data.result.user_side_identifier)
    rm_link.attr('data-method', 'delete').attr('data-remote', true).attr('rel', 'nofollow')
    rm_link.html('x')
    
    actions.append img
    tmbnl.append rm_link
    tmbnl.append actions

    li.append tmbnl
    
    # after showing thubnail disable progressbar and set width 0% to fix firefox progress bar issue
    if navigator.appName == 'Microsoft Internet Explorer'
      $('#ieProgress').hide();
    else
      $('#progressbar').hide();
      $('#progressbar .bar').css("width",'0%')

    if data.result.modal == 'supplier' or data.result.modal == 'contractor'
      $('.thumbnails').find('li').first().remove();

    # adding file thumnail
    li.hide()
    $('.thumbnails.' + data.result.type).append li
    li.toggle 'fade'

