json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.provider_id event.provider_id
  json.site_id event.site_id
  json.title event.title
  json.start event.start.strftime(date_format)
  json.end event.end.strftime(date_format)
  json.status event.status
  json.hide_from_schedule event.hide_from_schedule
  json.custom_pay_rate event.custom_pay_rate
  json.custom_bill_rate event.custom_bill_rate
  json.area event.area
  json.note event.note
  json.filledon event.filledon
  json.access_id event.access_id
  json.last_modified_by_x_on_y event.last_modified_by_x_on_y

  json.color event.color unless event.color.blank?
  json.allDay event.all_day_event? ? true : false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
end
