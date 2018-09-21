module ApplicationHelper
    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def user_form
      common_options = { validate: true, html: { class: 'user-form' } }
      form_options = current_user ? [ current_user, { url: signup_as_new_path(current_user.id), method: :post, validate: true }.merge(common_options) ] : [ User.new, { validate: true }.merge(common_options) ]
      form_for *form_options do |f|
        yield f
      end
    end

    def link_to_add_fields(name, f, association, **args)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize, f: builder)
      end
      link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})

    end
end
