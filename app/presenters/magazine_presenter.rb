class MagazinePresenter < BasePresenter
  presents :magazine

  def preview
    h.link_to magazine.file.url, target: '_blank', title: magazine.name, class: 'magazine-preview' do
      h.image_tag magazine.image.show
    end
  end

  def name
    h.content_tag :div, class: 'magazine-publication-name' do
      magazine.name
    end
  end

  def date
    h.content_tag :div, class: 'magazine-publication-date' do
      h.l magazine.date, format: :long
    end
  end

  def view
    h.link_to 'View Issue', magazine.file.url, target: '_blank', class: 'magazine-publication-view content-box-ghost-button aside'
  end
end
