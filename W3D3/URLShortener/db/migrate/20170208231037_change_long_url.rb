class ChangeLongUrl < ActiveRecord::Migration
  def change
    remove_index :shortened_urls, :long_url
    remove_index :shortened_urls, :short_url

    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url
  end
end
