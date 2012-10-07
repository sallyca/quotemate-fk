# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120309105401) do

  create_table "advertising_campaigns", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertising_formats", :force => true do |t|
    t.string   "description"
    t.string   "size"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertising_medias", :force => true do |t|
    t.integer  "type_id"
    t.integer  "format_id"
    t.integer  "motif_id"
    t.integer  "campaign_id"
    t.integer  "source_id"
    t.string   "media_url"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertising_medias", ["campaign_id", "source_id", "type_id", "format_id", "motif_id"], :name => "associations_index", :unique => true

  create_table "advertising_motifs", :force => true do |t|
    t.string   "description"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertising_sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertising_types", :force => true do |t|
    t.string   "description"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "news_read_at"
    t.string   "password_salt",                             :null => false
    t.string   "encrypted_password",                        :null => false
    t.string   "email",                                     :null => false
    t.boolean  "exclude_from_reporting", :default => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.string   "trained_for"
    t.datetime "trained_at"
  end

  create_table "agents_roles", :id => false, :force => true do |t|
    t.integer "agent_id"
    t.integer "role_id"
  end

  add_index "agents_roles", ["agent_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id", :unique => true
  add_index "agents_roles", ["role_id"], :name => "fk_roles_users_roles"

  create_table "attachments", :force => true do |t|
    t.integer  "message_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template_file_name"
    t.string   "template_content_type"
    t.integer  "template_file_size"
    t.datetime "template_updated_at"
    t.boolean  "template_modified"
    t.integer  "customer_id"
  end

  add_index "attachments", ["customer_id"], :name => "index_attachments_on_customer_id"
  add_index "attachments", ["message_id"], :name => "index_attachments_on_message_id"

  create_table "call_backs", :force => true do |t|
    t.datetime "due_at"
    t.integer  "type",               :default => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_id"
    t.datetime "deleted_at"
    t.string   "agent_email"
    t.string   "request_identifier"
  end

  add_index "call_backs", ["request_id"], :name => "index_call_backs_on_request_id"

  create_table "car_colors", :force => true do |t|
    t.string "brand_name"
    t.string "option_name"
    t.string "custom_value"
    t.string "default_color_name"
  end

  add_index "car_colors", ["brand_name", "option_name"], :name => "index_car_colors_on_brand_name_and_option_name", :unique => true

  create_table "car_configuration_groups", :force => true do |t|
    t.string   "name",                                  :null => false
    t.string   "slug",                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
    t.text     "description"
    t.boolean  "hidden",             :default => false, :null => false
    t.integer  "selection_title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "line_page"
    t.boolean  "hide_bonus",         :default => false, :null => false
    t.text     "details"
    t.text     "details_html"
  end

  add_index "car_configuration_groups", ["model_id"], :name => "index_car_configuration_groups_on_model_id"
  add_index "car_configuration_groups", ["slug"], :name => "index_car_configuration_groups_on_slug", :unique => true

  create_table "car_meta_records", :force => true do |t|
    t.string   "brand_name",     :limit => 20
    t.string   "line_name",      :limit => 40
    t.string   "body_name",      :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "blacklisted",                  :default => false, :null => false
    t.text     "seo_text"
    t.text     "info"
    t.integer  "priority"
    t.string   "vehicle_number"
    t.text     "seo_raw_text"
    t.text     "raw_info"
    t.string   "brand_slug",     :limit => 20
    t.string   "line_slug",      :limit => 40
    t.string   "body_slug",      :limit => 20
  end

  add_index "car_meta_records", ["brand_name", "line_name", "body_name", "vehicle_number"], :name => "blbj_on_blacklist_items", :unique => true

  create_table "car_models", :force => true do |t|
    t.string   "permalink",                                                                                          :null => false
    t.string   "name",                                                                                               :null => false
    t.decimal  "list_price",                                        :precision => 8, :scale => 2,                    :null => false
    t.string   "primary_fuel"
    t.integer  "ps"
    t.integer  "kw"
    t.integer  "ccm"
    t.integer  "doors"
    t.integer  "overall_weight"
    t.integer  "empty_weight"
    t.string   "wheel_drive"
    t.integer  "number_of_cylinders"
    t.string   "cylinder_arrangement"
    t.string   "emission_group"
    t.decimal  "consumption_city",                                  :precision => 4, :scale => 2
    t.decimal  "consumption_country",                               :precision => 4, :scale => 2
    t.decimal  "consumption_mix",                                   :precision => 4, :scale => 2
    t.integer  "ece_co2"
    t.decimal  "acceleration",                                      :precision => 4, :scale => 2
    t.integer  "fuel_capacity"
    t.integer  "trunk_capacity"
    t.integer  "max_torque"
    t.integer  "max_revolutions"
    t.string   "dieselpartikelfilter"
    t.string   "model_year"
    t.integer  "topspeed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled",                                                                         :default => false, :null => false
    t.datetime "deprecated_at"
    t.string   "tsn"
    t.string   "hsn"
    t.decimal  "best_discount_percent",                             :precision => 6, :scale => 4, :default => 0.0,   :null => false
    t.string   "brand_name",                          :limit => 20
    t.string   "line_name",                           :limit => 40
    t.string   "body_name",                           :limit => 20
    t.string   "brand_slug",                          :limit => 20
    t.string   "line_slug",                           :limit => 40
    t.string   "body_slug",                           :limit => 20
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "best_discounted_price",               :limit => 8,                                :default => 0,     :null => false
    t.text     "standard_equipments"
    t.string   "jato_brand_name"
    t.string   "jato_line_name"
    t.string   "jato_body_name"
    t.string   "cab_style"
    t.string   "trim_level"
    t.string   "data_status"
    t.string   "vehicle_number_version"
    t.string   "vehicle_number"
    t.string   "vehicle_id"
    t.string   "transmission_type"
    t.integer  "gears_count"
    t.integer  "sale_count",                                                                      :default => 0
    t.integer  "best_discounted_price_with_delivery",                                             :default => 0,     :null => false
    t.decimal  "best_base_discount_percent",                        :precision => 6, :scale => 4, :default => 0.0
    t.string   "energy_efficiency"
    t.string   "secondary_fuel"
    t.boolean  "broken",                                                                          :default => false
    t.decimal  "best_discount_margin_percent",                      :precision => 4, :scale => 2
    t.integer  "best_discount_trader_amount"
    t.integer  "best_discount_delivery_period"
  end

  add_index "car_models", ["brand_name", "line_name", "body_name"], :name => "index_car_models_on_brand_name_and_line_name_and_body_name"
  add_index "car_models", ["brand_slug", "line_slug", "body_slug"], :name => "index_car_models_on_brand_slug_and_line_slug_and_body_slug"
  add_index "car_models", ["enabled", "deprecated_at", "brand_slug", "line_slug", "body_slug"], :name => "car_models_on_en_de_bs_ls_bs"
  add_index "car_models", ["permalink"], :name => "index_car_models_on_permalink"
  add_index "car_models", ["vehicle_id"], :name => "index_car_models_on_vehicle_id"
  add_index "car_models", ["vehicle_number_version"], :name => "index_car_models_on_vehicle_number_version"

  create_table "conversations", :force => true do |t|
    t.integer  "agent_id"
    t.boolean  "incoming"
    t.integer  "state"
    t.datetime "date"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "documented_id"
    t.string   "documented_type"
    t.string   "agent_first_name"
    t.string   "agent_last_name"
    t.string   "agent_email"
    t.integer  "agent_agent_id"
    t.integer  "customer_id"
  end

  add_index "conversations", ["customer_id"], :name => "index_conversations_on_customer_id"
  add_index "conversations", ["documented_id", "documented_type"], :name => "index_conversations_on_documented_id_and_documented_type"

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.string   "company"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.boolean  "newsletter",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
    t.string   "media_identifier"
    t.string   "referrer"
    t.string   "ip_address"
    t.integer  "media_id"
    t.string   "fax"
    t.string   "contact"
    t.string   "identifier"
    t.integer  "agent_id"
    t.string   "brokerage_contract"
  end

  add_index "customers", ["agent_id"], :name => "index_customers_on_agent_id"
  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true

  create_table "delivery_periods", :force => true do |t|
    t.string   "brand_slug",        :null => false
    t.string   "line_slug",         :null => false
    t.string   "body_name"
    t.integer  "doors"
    t.string   "primary_fuel"
    t.integer  "kw"
    t.string   "transmission_type"
    t.string   "wheel_drive"
    t.integer  "period",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discount_rules", :force => true do |t|
    t.integer  "trader_id"
    t.string   "brand"
    t.string   "line"
    t.string   "body"
    t.string   "fuel"
    t.integer  "kw"
    t.date     "from"
    t.date     "to"
    t.integer  "delivery_period"
    t.boolean  "gw_ankauf"
    t.string   "special"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vehicle_number"
    t.string   "trim_level"
    t.integer  "discount_type"
    t.integer  "doors"
    t.boolean  "financing",              :default => false
    t.boolean  "international_exchange", :default => false
    t.text     "deliveries"
    t.text     "bonus_data"
    t.string   "identifier"
  end

  create_table "documents", :force => true do |t|
    t.string   "file"
    t.string   "value"
    t.integer  "request_id", :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["request_id", "name"], :name => "index_documents_on_request_id_and_name", :unique => true

  create_table "events", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "owner_id"
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "action"
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.boolean  "read",         :default => false, :null => false
    t.datetime "created_at"
    t.string   "creator_type"
  end

  add_index "events", ["creator_id"], :name => "index_events_on_creator_id"
  add_index "events", ["owner_id"], :name => "index_events_on_owner_id"
  add_index "events", ["subject_id", "subject_type"], :name => "index_events_on_subject_id_and_subject_type"

  create_table "incentives", :force => true do |t|
    t.string   "name",                                       :null => false
    t.text     "desc",                                       :null => false
    t.decimal  "price",        :precision => 8, :scale => 2
    t.text     "address"
    t.string   "email"
    t.text     "process_desc"
    t.date     "valid_from",                                 :null => false
    t.date     "valid_to"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_templates", :force => true do |t|
    t.integer  "agent_id"
    t.string   "identifier", :null => false
    t.string   "name",       :null => false
    t.text     "text",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_templates", ["identifier"], :name => "index_message_templates_on_identifier", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "conversation_id"
    t.datetime "date"
    t.boolean  "incoming",         :default => false
    t.boolean  "draft",            :default => false
    t.string   "subject"
    t.text     "text",                                :null => false
    t.string   "from"
    t.string   "to"
    t.datetime "read"
    t.string   "message_id"
    t.string   "in_reply_to"
    t.text     "references"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agent_first_name"
    t.string   "agent_last_name"
    t.string   "agent_email"
    t.integer  "agent_agent_id"
    t.integer  "customer_id"
  end

  add_index "messages", ["agent_id"], :name => "index_messages_on_agent_id"
  add_index "messages", ["conversation_id"], :name => "index_messages_on_conversation_id"
  add_index "messages", ["customer_id"], :name => "index_messages_on_customer_id"
  add_index "messages", ["draft"], :name => "index_messages_on_deleted_at_and_request_id_and_draft"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth2s", :force => true do |t|
    t.string   "api"
    t.string   "refresh_token"
    t.string   "access_token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2s", ["api"], :name => "index_oauth2s_on_api"

  create_table "offers", :force => true do |t|
    t.integer  "trader_id"
    t.integer  "delivery_type"
    t.integer  "delivery_cost"
    t.string   "delivery_location"
    t.decimal  "discount_extras",               :precision => 4, :scale => 2
    t.integer  "delivery_period"
    t.boolean  "gw_ankauf"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "special"
    t.decimal  "list_price",                    :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "extra_price",                   :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "total_price",                   :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "hidden",                                                      :default => false, :null => false
    t.string   "name"
    t.text     "comment"
    t.integer  "configuration_group_id"
    t.datetime "delay_notification_sent_at"
    t.integer  "discount_type"
    t.decimal  "price_with_incentives_cached",  :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "financing",                                                   :default => false
    t.boolean  "international_exchange",                                      :default => false
    t.string   "trader_name"
    t.integer  "trader_gender"
    t.string   "trader_first_name"
    t.string   "trader_last_name"
    t.string   "trader_email"
    t.string   "trader_phone"
    t.string   "trader_fax"
    t.string   "trader_street"
    t.string   "trader_city"
    t.string   "trader_zip"
    t.text     "trader_additional_information"
    t.string   "trader_trader_id"
    t.text     "bonus_data"
    t.text     "options_data"
    t.string   "vehicle_id"
    t.boolean  "active",                                                      :default => false
    t.string   "brand_name"
    t.string   "line_name"
    t.string   "body_name"
    t.string   "model_name"
    t.string   "engine"
    t.integer  "doors"
    t.integer  "customer_id"
    t.integer  "number"
    t.text     "financing_data"
    t.text     "leasing_data"
    t.string   "purchase_type"
    t.decimal  "non_discountable_extra_price",  :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "configurable",                                                :default => true
    t.string   "trim_level"
    t.string   "hsn"
    t.string   "tsn"
    t.string   "identifier"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_company"
    t.string   "customer_street"
    t.string   "customer_zip"
    t.string   "customer_city"
    t.string   "customer_country"
    t.string   "customer_phone"
    t.string   "customer_mobile"
    t.string   "customer_email"
    t.string   "customer_fax"
    t.string   "customer_contact"
    t.string   "customer_identifier"
    t.integer  "customer_gender"
    t.date     "customer_date_of_birth"
  end

  add_index "offers", ["configuration_group_id"], :name => "index_offers_on_configuration_group_id"
  add_index "offers", ["customer_id", "number"], :name => "index_offers_on_customer_id_and_identifier", :unique => true
  add_index "offers", ["customer_id"], :name => "index_offers_on_customer_id"
  add_index "offers", ["id", "name"], :name => "id_offers_on_id_and_name"
  add_index "offers", ["identifier"], :name => "index_offers_on_identifier", :unique => true
  add_index "offers", ["vehicle_id"], :name => "index_offers_on_vehicle_id"

  create_table "pages", :force => true do |t|
    t.string   "slug",                               :null => false
    t.text     "body",                               :null => false
    t.text     "body_html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "description"
    t.string   "tracking_url"
    t.boolean  "sitemap",         :default => false, :null => false
    t.string   "breadcrumb_name"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "phone_calls", :force => true do |t|
    t.integer  "request_id"
    t.integer  "agent_id"
    t.datetime "closed_at"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "last"
  end

  add_index "phone_calls", ["request_id", "status"], :name => "index_phone_calls_on_request_id_and_status"

  create_table "referrals", :force => true do |t|
    t.integer  "request_id"
    t.integer  "agent_id"
    t.integer  "amount"
    t.integer  "partner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referrals", ["agent_id"], :name => "index_referrals_on_agent_id"
  add_index "referrals", ["request_id"], :name => "index_referrals_on_request_id"

  create_table "request_incentives", :force => true do |t|
    t.integer  "incentive_id",                               :null => false
    t.integer  "request_id",                                 :null => false
    t.decimal  "price",        :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_incentives", ["incentive_id", "request_id"], :name => "index_request_incentives_on_incentive_id_and_request_id", :unique => true

  create_table "request_predictions", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "request_id"
    t.decimal  "prediction", :precision => 10, :scale => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_predictions", ["agent_id", "request_id"], :name => "index_request_predictions_on_agent_id_and_request_id"

  create_table "requests", :force => true do |t|
    t.integer  "customer_id"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
    t.boolean  "interest_cash",                                             :default => false, :null => false
    t.boolean  "interest_leasing",                                          :default => false, :null => false
    t.boolean  "interest_financing",                                        :default => false, :null => false
    t.boolean  "interest_used_car"
    t.boolean  "interest_insurance"
    t.boolean  "scrapping_incentive"
    t.boolean  "customer_offer",                                            :default => false
    t.string   "agent_first_name"
    t.string   "agent_last_name"
    t.string   "agent_email"
    t.integer  "agent_agent_id"
    t.datetime "assigned_at"
    t.datetime "sent_to_trader_at"
    t.datetime "sale_contract_at"
    t.datetime "wait_for_delivery_at"
    t.datetime "delivered_at"
    t.datetime "commission_invoice_at"
    t.datetime "canceled_at"
    t.string   "invoice_number"
    t.text     "cancelation_reason"
    t.datetime "last_called_at"
    t.boolean  "phone_invalid",                                             :default => false
    t.datetime "delay_email_sent_at"
    t.datetime "not_reached_email_sent_at"
    t.boolean  "outbound",                                                  :default => true
    t.datetime "phone_invalid_email_sent_at"
    t.decimal  "real_list_price",             :precision => 8, :scale => 2, :default => 0.0
    t.datetime "callback_wished_at"
    t.datetime "purchase_planned_at"
    t.boolean  "competitive_offer_present"
    t.datetime "notify_dispo_at"
  end

  add_index "requests", ["assigned_at", "canceled_at", "last_called_at"], :name => "index_requests_on_assigned_at_and_canceled_at_and_last_called_at"
  add_index "requests", ["customer_id"], :name => "fk_requests_customers"
  add_index "requests", ["identifier"], :name => "index_requests_on_identifier", :unique => true
  add_index "requests", ["offer_id"], :name => "index_requests_on_offer_id"

  create_table "roles", :force => true do |t|
    t.string "title", :null => false
  end

  add_index "roles", ["title"], :name => "index_roles_on_title", :unique => true

  create_table "settings", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teaser_assignments", :force => true do |t|
    t.integer  "teaser_id",       :null => false
    t.integer  "teaser_group_id", :null => false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teaser_groups", :force => true do |t|
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teasers", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.date     "publishes_at",                             :null => false
    t.date     "expires_at",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_configuration_group_id"
    t.string   "brand_slug",                 :limit => 20
    t.string   "line_slug",                  :limit => 40
    t.string   "body_slug",                  :limit => 20
  end

  create_table "traders", :force => true do |t|
    t.string   "name"
    t.string   "trader_id"
    t.integer  "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "additional_information"
    t.boolean  "sixt_delivery",          :default => false
    t.text     "required_documents"
  end

end
