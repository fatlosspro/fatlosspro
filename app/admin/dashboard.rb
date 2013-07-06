ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Recent Articles" do
          ul do
            Article.last(5).map do |article|
              li link_to(article.title, admin_article_path(article))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "To edit header facebook/etc links navigate to app/views/application/_header.html.slim"
          para "There will be three lines like 'li.right = link_to \"#\", class: 'link' do'"
          para "followed by provider icon tag (ex: i.icon-facebook-sign.icon-large)"
          para "Substitute the # sign with the link you want this sign to be pointing to"
        end
      end
      
    end

  end # content
end
