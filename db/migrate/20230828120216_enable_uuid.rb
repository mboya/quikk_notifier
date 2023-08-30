# frozen_string_literal: true

# Migration: EnableUuid
class EnableUuid < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    enable_extension 'uuid-ossp'
  end
end
