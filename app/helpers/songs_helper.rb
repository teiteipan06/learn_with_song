module SongsHelper
  def song(opts)
    iframe = content_tag(
      :iframe,
      '', # empty body
      width: 560,
      height: 315,
      src: "https://www.youtube.com/embed/#{opts[:song_id]}",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end
end
