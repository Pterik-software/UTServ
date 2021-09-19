select 
business_id, item_name, lang_item_name, 
is_active_locally, 
(select lang_name from set_yes_or_no r where r.id = b.is_active_locally) lng_active_locally, 
is_active_server, 
(select lang_name from set_yes_or_no t where t.id = b.is_active_server) lng_active_server, 
reason_deactivated, updated_by, updated_datetime, 
log_changes
from business_items b; 


  