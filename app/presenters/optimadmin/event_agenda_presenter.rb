module Optimadmin
  class EventAgendaPresenter < Optimadmin::BasePresenter
    presents :event_agenda

    def name
      event_agenda.name
    end

    def start_time
      h.l event_agenda.start_time, format: :short
    end

    def end_time
      h.l event_agenda.end_time, format: :short
    end

    def category
      event_agenda.event_category.name
    end

    def content
      h.raw event_agenda.content
    end

    def price
      h.number_to_currency event_agenda.price
    end

    def table_size
      event_agenda.table_size
    end

    def table_discount
      h.number_to_percentage(event_agenda.table_discount, precision: 2)
    end
  end
end
