module ApplicationHelper
    def to_markdown(text)
     html_render_options = {
       filter_html:     true, # no input tag or textarea
       hard_wrap:       true,
       link_attributes: { rel: 'nofollow' }
     }

     markdown_options = {
       autolink:           true,
       fenced_code_blocks: true,
       lax_spacing:        true,
       no_intra_emphasis:  true,
       strikethrough:      true,
       superscript:        true
     }

     renderer = Redcarpet::Render::HTML.new(html_render_options)
     markdown = Redcarpet::Markdown.new(renderer, markdown_options)
     raw markdown.render(text)
   end

   def avatar_url(user, size)
     gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
   end

   def render_user_avatar(user, size)
  if user.avatar.present?
    user.avatar
  else
    avatar_url(user, size)
  end
end
end
