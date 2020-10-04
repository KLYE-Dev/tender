# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_29_023550) do

  create_table "checkpoints", force: :cascade do |t|
    t.integer "block_num", null: false
    t.string "block_hash", null: false
    t.datetime "block_timestamp", null: false
    t.string "ref_trx_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_deploys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "name", null: false
    t.string "params", null: false
    t.text "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "name"], name: "contract_deploys-by-trx_id-name"
  end

  create_table "contract_updates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "name", null: false
    t.string "params", null: false
    t.text "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "name"], name: "contract_updates-by-trx_id-name"
  end

  create_table "inflation_issue_new_tokens", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id"], name: "inflation_issue_new_tokens-by-trx_id"
  end

  create_table "market_buys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.string "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "market_buys-by-trx_id-symbol"
  end

  create_table "market_cancels", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "action_type", null: false
    t.string "action_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "action_type", "action_id"], name: "market_cancels-by-trx_id-action_type-action_id"
  end

  create_table "market_sells", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.string "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "market_sells-by-trx_id-symbol"
  end

  create_table "market_unlock_tokens", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "recipient", null: false
    t.string "amount_steemsbd", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "recipient", "amount_steemsbd"], name: "market_unlock_tokens-by-trx_id-recipient-amount_steemsbd"
  end

  create_table "nft_add_authorized_issuing_accounts", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "accounts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_add_authorized_issuing_accounts-by-trx_id-symbol"
  end

  create_table "nft_add_authorized_issuing_contracts", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "contracts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_add_authorized_issuing_contracts-by-trx_id-symbol"
  end

  create_table "nft_add_properties", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "name", null: false
    t.string "property_type", null: false
    t.boolean "is_read_only", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "authorized_editing_accounts"
    t.index ["trx_id", "symbol", "name", "property_type"], name: "nft_add_properties-by-trx_id-symbol-name-property_type"
  end

  create_table "nft_burns", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.text "nfts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nft_creates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "name", null: false
    t.string "url", default: "", null: false
    t.string "max_supply"
    t.text "authorized_issuing_accounts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_creates-by-trx_id-symbol"
  end

  create_table "nft_delegates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "from"
    t.string "from_type"
    t.string "to", null: false
    t.string "to_type"
    t.text "nfts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "to"], name: "nft_delegates-by-trx_id-to"
  end

  create_table "nft_enable_delegations", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "undelegation_cooldown", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_enable_delegations-by-trx_id-symbol"
  end

  create_table "nft_issue_multiples", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.text "instances", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nft_issues", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "to", null: false
    t.string "fee_symbol", null: false
    t.text "lock_tokens", null: false
    t.text "properties", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol", "to", "fee_symbol"], name: "nft_issues-by-trx_id-symbol-to-fee_symbol"
  end

  create_table "nft_remove_authorized_issuing_accounts", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "accounts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_remove_authorized_issuing_accounts-by-trx_id-symbol"
  end

  create_table "nft_remove_authorized_issuing_contracts", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "contracts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_remove_authorized_issuing_contracts-by-trx_id-symbol"
  end

  create_table "nft_set_group_bys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "properties", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_set_group_bys-by-trx_id-symbol"
  end

  create_table "nft_set_properties", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "fromType"
    t.text "nfts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_set_properties-by-trx_id-symbol"
  end

  create_table "nft_set_property_permissions", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "name", null: false
    t.text "accounts"
    t.text "contracts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_set_property_permissions-by-trx_id-symbol"
  end

  create_table "nft_transfer_ownerships", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "to", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_transfer_ownerships-by-trx_id-symbol"
  end

  create_table "nft_transfers", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "from"
    t.string "from_type"
    t.string "to", null: false
    t.string "to_type"
    t.text "nfts"
    t.string "memo", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "to"], name: "nft_transfers-by-trx_id-to"
  end

  create_table "nft_undelegates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "from_type"
    t.text "nfts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nft_update_metadata", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "metadata", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_update_metadata-by-trx_id-symbol"
    t.index ["trx_id", "symbol"], name: "nftmarket_enable_markets-by-trx_id-symbol"
  end

  create_table "nft_update_names", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_update_names-by-trx_id-symbol"
  end

  create_table "nft_update_params", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "nft_creation_fee"
    t.string "nft_issuance_fee"
    t.string "data_property_creation_fee"
    t.string "enable_delegation_fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nft_update_urls", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nft_update_urls-by-trx_id-symbol"
  end

  create_table "nftmarket_buys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "nfts", null: false
    t.string "market_account", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nftmarket_buys-by-trx_id-symbol"
  end

  create_table "nftmarket_cancels", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "nfts", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nftmarket_cancels-by-trx_id-symbol"
  end

  create_table "nftmarket_change_prices", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "nfts", null: false
    t.string "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nftmarket_change_prices-by-trx_id-symbol"
  end

  create_table "nftmarket_enable_markets", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nftmarket_sells", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "nfts", null: false
    t.string "price", null: false
    t.integer "fee", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "symbol"], name: "nftmarket_sells-by-trx_id-symbol"
  end

  create_table "sscstore_buys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "recipient", null: false
    t.string "amount_steemsbd", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "recipient"], name: "sscstore_buys-by-trx_id-recipient"
  end

  create_table "steempegged_buys", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "recipient", null: false
    t.string "amount_steemsbd", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "recipient"], name: "steempegged_buys-by-trx_id-recipient"
  end

  create_table "steempegged_remove_withdrawals", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "action_id", null: false
    t.string "recipient", null: false
    t.string "amount_steemsbd", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "recipient"], name: "steempegged_remove_withdrawals-by-trx_id-action_id-recipient"
  end

  create_table "steempegged_withdraws", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens_cancel_unstakes", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "tx_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "tx_id"], name: "tokens_cancel_unstakes-by-trx_id-tx_id"
    t.index ["trx_id"], name: "tokens_cancel_unstakes-by-trx_id"
  end

  create_table "tokens_check_pending_undelegations", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id"], name: "tokens_check_pending_undelegations-by-trx_id"
  end

  create_table "tokens_check_pending_unstakes", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id"], name: "tokens_check_pending_unstakes-by-trx_id"
  end

  create_table "tokens_creates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "name", null: false
    t.string "url", default: "", null: false
    t.integer "precision", null: false
    t.integer "max_supply", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symbol"], name: "tokens_creates-by-symbol", unique: true
    t.index ["trx_id", "symbol"], name: "tokens_creates-by-trx_id-symbol"
  end

  create_table "tokens_delegates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "to", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "to", "symbol"], name: "tokens_delegates-by-to-symbol"
    t.index ["trx_id"], name: "tokens_delegates-by-trx_id"
  end

  create_table "tokens_enable_delegations", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.integer "undelegation_cooldown", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"trx_id\", \"to\", \"symbol\"", name: "tokens_enable_delegations-by-symbol"
    t.index ["trx_id"], name: "tokens_enable_delegations-by-trx_id"
  end

  create_table "tokens_enable_stakings", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.integer "unstaking_cooldown", null: false
    t.integer "number_transactions", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_enable_stakings-by-trx_id-symbol"
  end

  create_table "tokens_issues", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "to", null: false
    t.string "quantity", null: false
    t.string "memo", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol", "to"], name: "tokens_issues-by-trx_id-symbol-to"
    t.index ["trx_id", "symbol"], name: "tokens_issues-by-trx_id-symbol"
  end

  create_table "tokens_stakes", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_stakes-by-trx_id-symbol"
  end

  create_table "tokens_transfer_ownerships", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_transfer_ownerships-by-trx_id-symbol"
  end

  create_table "tokens_transfer_to_contracts", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "to", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "to", "symbol"], name: "tokens_transfer_to_contracts-by-to-symbol"
    t.index ["trx_id"], name: "tokens_transfer_to_contracts-by-trx_id"
  end

  create_table "tokens_transfers", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "to", null: false
    t.string "quantity", null: false
    t.string "memo", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol", "to"], name: "tokens_transfers-by-trx_id-symbol-to"
    t.index ["trx_id", "symbol"], name: "tokens_transfers-by-trx_id-symbol"
  end

  create_table "tokens_undelegates", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "from", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "from", "symbol"], name: "tokens_undelegates-by-from-symbol"
    t.index ["trx_id"], name: "tokens_undelegates-by-trx_id"
  end

  create_table "tokens_unstakes", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_unstakes-by-trx_id-symbol"
  end

  create_table "tokens_update_metadata", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "metadata", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_update_metadata-by-trx_id-symbol"
  end

  create_table "tokens_update_params", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.text "token_creation_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens_update_precisions", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.integer "precision", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"trx_id\", \"to\", \"symbol\"", name: "tokens_update_precisions-by-to-symbol"
    t.index ["trx_id"], name: "tokens_update_precisions-by-trx_id"
  end

  create_table "tokens_update_urls", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "symbol", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trx_id", "symbol"], name: "tokens_update_urls-by-trx_id-symbol"
  end

  create_table "transaction_accounts", force: :cascade do |t|
    t.string "account", null: false
    t.integer "trx_id", null: false
    t.index ["account", "trx_id"], name: "transaction_accounts-by-symbol-trx_id", unique: true
  end

  create_table "transaction_symbols", force: :cascade do |t|
    t.string "symbol", null: false
    t.integer "trx_id", null: false
    t.index ["symbol", "trx_id"], name: "transaction_symbols-by-symbol-trx_id", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "block_num", null: false
    t.integer "ref_steem_block_num", null: false
    t.string "trx_id", null: false
    t.integer "trx_in_block", null: false
    t.string "sender", null: false
    t.string "contract", null: false
    t.string "action", null: false
    t.text "payload", null: false
    t.string "executed_code_hash", null: false
    t.string "hash", null: false
    t.string "database_hash", null: false
    t.text "logs", null: false
    t.datetime "timestamp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_error", default: true, null: false
    t.index ["block_num", "trx_id", "trx_in_block", "sender", "contract", "action", "is_error", "timestamp"], name: "transactions-by-trx_id-trx_in_block-sender-contract-action-is"
    t.index ["block_num", "trx_id", "trx_in_block", "sender", "contract", "action", "timestamp"], name: "transactions-by-trx_id-trx_in_block-sender-contract-action-ti"
    t.index ["block_num", "trx_id", "trx_in_block"], name: "transactions-by-block_num-trx_id-trx_in_block", unique: true
    t.index ["database_hash", "trx_id", "trx_in_block"], name: "transactions-by-database_hash-trx_id-trx_in_block", unique: true
    t.index ["hash"], name: "transactions-by-hash", unique: true
    t.index ["trx_id", "trx_in_block"], name: "transactions-by-trx_id-trx_in_block"
    t.index ["trx_in_block", "timestamp"], name: "transactions-by-trx_in_block-timestamp"
  end

  create_table "witnesses_approves", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "witness", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "witness"], name: "witnesses_approves-by-trx_id-witness"
  end

  create_table "witnesses_disapproves", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "witness", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "witness"], name: "witnesses_disapproves-by-trx_id-witness"
  end

  create_table "witnesses_propose_rounds", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.integer "round", null: false
    t.string "round_hash", null: false
    t.text "signatures", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "round"], name: "witnesses_propose_rounds-by-trx_id-round"
  end

  create_table "witnesses_registers", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "ip", null: false
    t.integer "rpc_port", null: false
    t.integer "p2p_port", null: false
    t.string "signing_key", null: false
    t.boolean "enabled", null: false
    t.string "recipient", default: "", null: false
    t.string "amount_steemsbd", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id", "ip", "signing_key", "recipient"], name: "witnesses_registers-by-trx_id-ip-signing_key-recipient"
  end

  create_table "witnesses_schedule_witnesses", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_id"], name: "witnesses_schedule_witnesses-by-trx_id"
  end

  create_table "witnesses_update_witness_approvals", force: :cascade do |t|
    t.integer "trx_id", null: false
    t.string "account", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"trx_id,\", \"account\"", name: "witnesses_update_witness_approvals-by-trx_id-account"
  end

end
