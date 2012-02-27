# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on('shown', '.collapse', ->
  btn = $('button.more', $(this).parent())
  btn.text(btn.attr('data-fold-txt'))
)
$(document).on('hidden', '.collapse', ->
  btn = $('button.more', $(this).parent())
  btn.text(btn.attr('data-unfold-txt'))
)
$(document).on('click', '.paging .btn', -> $(this).button('loading'))
$(document).on('click', '.paging a', () ->
  url = $(this).attr('href')
  matched = url.match(/FB.ApiServer._callbacks.([^&]+)/)
  callback_id = matched[1]
  FB.ApiServer._callbacks[callback_id] = (response) ->
    on_loaded_next_page(response)
    delete FB.ApiServer._callbacks[callback_id]
  $('body').append('<script src="' + url + '"></script>')
  false
)

template = Hogan.compile $('#template_results').text()
template_posts = Hogan.compile $('#template_posts').text()
template_post_message = Hogan.compile $('#template_post_message').text()
template_others = Hogan.compile $('#template_others').text()
template_loading = Hogan.compile $('#template_loading').text()

search = (query) -> 
  f = $('form.search')
  $('input[name=q]', f).val(query)
  f.submit()

$('form.search').submit ->
  input = $('input[name=q]', this).attr('disabled', true)
  $('div.results').html(template_loading.render())
  query = input.val()
  FB.api '/search?type=post&q=' + query, (response) -> on_loaded(response)
  return false

on_loaded_next_page = (response) ->
  if 'data' of response
    response['data'].map (item) ->
      fold_message(item)
      return item
  html = template_posts.render(response)
  html = $(html)
  $("abbr.timeago", html).timeago()
  $(".collapse", html).collapse('hide')
  $('.message', html).autolink({target: '_blank'})
  $('ul.posts').append(html)
  html = template_others.render(response)
  $('.results .others').html(html)

fold_message = (item) ->
  return unless 'message' of item
  item['message'] = item['message'].replace(/\n/g, '<br />')
  offset = -1
  for i in [0..4]
    offset = item['message'].indexOf('<br />', offset + 1)
    break if offset < 0
  if offset > -1
    offset += 6
    message = item['message']
    item['message'] = () ->
      template_post_message.render({
        id: item['id'],
        beginning: message[0...offset],
        remaining: message[offset..-1]
      })

on_loaded = (response) ->
  if 'data' of response
    response['data'].map (item) ->
      fold_message(item)
      return item
    response['data'] = template_posts.render(response)

  response['others'] = template_others.render(response)
  html = template.render(response)
  $('div.results').html(html)
  $('form.search input[name=q]').attr('disabled', false)
  $("abbr.timeago").timeago()
  $(".collapse").collapse('hide')
  $('.message').autolink({target: '_blank'})

window.fbAsyncInit = () ->
  search 'water'

f = (d) ->
   js = null
   id = 'facebook-jssdk'
   ref = d.getElementsByTagName('script')[0]
   return if (d.getElementById(id))
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
f(document)
